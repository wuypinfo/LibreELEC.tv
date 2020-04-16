# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2020-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="availink-firmware"
PKG_VERSION="bd9cf2fd1cc3726d95a797477ceacf098f691bf6"
PKG_SHA256="407b5393052dcab9cb15a963558c8bba52aca643d91e4658027ec03f3578bfbb"
PKG_LICENSE="Availink"
PKG_URL="https://github.com/availink/linux-firmware-availink/archive/$PKG_VERSION.tar.gz"
PKG_LONGDESC="availink-firmware: Firmware for Availink demodulator chips"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_firmware_dir)
    cp -a availink $INSTALL/$(get_full_firmware_dir)
}
