# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8189FS"
PKG_VERSION="1"
PKG_SHA256="47fd66c42f8d697adca36a79b404ae487c0469c989c82fd06a58d456c3b6e5bf"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/mortaromarcello/rtl8189ES_linux"
PKG_URL="https://github.com/mortaromarcello/rtl8189ES_linux/archive/v1.tar.gz"
PKG_SOURCE_NAME="rtl8189ES_linux-1.tar.gz"
PKG_LONGDESC="Realtek RTL8189FS Linux driver"
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
