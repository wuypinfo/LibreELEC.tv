# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2020-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="availink"
PKG_VERSION="6964ea929e86e2d08bd96635a6a35aa57c50b1a9"
PKG_SHA256=""
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/availink/documentation"
PKG_URL="https://github.com/availink/dvb-frontends-availink/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="availink-firmware"
PKG_LONGDESC="availink: Availink demodulator drivers destined for Linux media-tree"
PKG_TOOLCHAIN="manual"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  kernel_make KERNELDIR=$(kernel_path) -C availink/ module
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    cp availink/*.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
