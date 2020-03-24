#!/bin/sh

# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

[ -z "$UPDATE_DIR" ] && UPDATE_DIR="/storage/.update"
[ -z "$SYSTEM_ROOT" ] && SYSTEM_ROOT=""
[ -z "$BOOT_ROOT" ] && BOOT_ROOT="/flash"
[ -z "$BOOT_PART" ] && BOOT_PART=$(df "$BOOT_ROOT" | tail -1 | awk {' print $1 '})

# identify the boot device
  if [ -z "$BOOT_DISK" ]; then
    case $BOOT_PART in
      /dev/sd[a-z][0-9]*)
        BOOT_DISK=$(echo $BOOT_PART | sed -e "s,[0-9]*,,g")
        ;;
      /dev/mmcblk*)
        BOOT_DISK=$(echo $BOOT_PART | sed -e "s,p[0-9]*,,g")
        ;;
    esac
  fi

# mount $BOOT_ROOT rw
  mount -o remount,rw $BOOT_ROOT

# update device tree
[ -d "$BOOT_ROOT/dtb_old" ] && rm -r $BOOT_ROOT/dtb_old
mv $BOOT_ROOT/dtb $BOOT_ROOT/dtb_old
cp -R $UPDATE_DIR/.tmp/*/3rdparty/bootloader/dtb $BOOT_ROOT

#  if [ -f $BOOT_ROOT/s905_autoscript ]; then
#      echo "Updating s905_autoscript"
#      cp -p $SYSTEM_ROOT/usr/share/bootloader/s905_autoscript $BOOT_ROOT 2>/dev/null || true
#  fi

#  if [ -f $BOOT_ROOT/emmc_autoscript ]; then
#      echo "Updating emmc_autoscript"
#      cp -p $SYSTEM_ROOT/usr/share/bootloader/emmc_autoscript $BOOT_ROOT 2>/dev/null || true
#  fi

# update u-boot scripts
#  if [ -f $BOOT_ROOT/boot.scr ]; then
#      echo "Updating boot.scr"
#      cp -p $SYSTEM_ROOT/usr/share/bootloader/boot.scr $BOOT_ROOT 2>/dev/null || true
#  fi

#  if [ -f $BOOT_ROOT/install2emmc.sh ]; then
#    for scriptfile in $SYSTEM_ROOT/usr/share/bootloader/*.sh ; do
#      echo "Updating $(basename $scriptfile)"
#      cp -p $scriptfile $BOOT_ROOT 2>/dev/null || true
#    done
#  fi

#  if [ -f $BOOT_ROOT/u-boot.ext ]; then
#      echo "Updating u-boot.ext"
#      cp -p $SYSTEM_ROOT/usr/share/bootloader/u-boot.ext $BOOT_ROOT 2>/dev/null || true
#  fi

# mount $BOOT_ROOT ro
  sync
  mount -o remount,ro $BOOT_ROOT
