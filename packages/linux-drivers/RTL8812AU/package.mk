# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8812AU"
PKG_VERSION="4aaf486f7f758a1b5132552420773780efdf946e"
PKG_SHA256="fa8f55a1998f860c4629c6e5ccc79e01164fbcfd59fb511fd22027962dc2d36a"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/MilhouseVH/RTL8812AU"
PKG_URL="https://github.com/MilhouseVH/RTL8812AU/archive/$PKG_VERSION.tar.gz"
PKG_LONGDESC="Realtek RTL8812AU Linux 3.x driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=$TARGET_KERNEL_ARCH \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=$TARGET_KERNEL_PREFIX \
       CONFIG_POWER_SAVING=n
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    cp *.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
