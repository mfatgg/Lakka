################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="hatari"
PKG_VERSION="437c2b8"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/libretro-hatari"
PKG_URL="$LAKKA_MIRROR/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS=""
PKG_BUILD_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="RetroArch"
PKG_SHORTDESC="An ARM-based SNES emulator for libretro"
PKG_LONGDESC="An ARM-based SNES emulator for libretro"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  echo "LIBCO_SRCS += \$(LIBCOOBJ)/armeabi_asm.o" >> build/makefile_common.mk
  sed -i -e "s/   CC = gcc//" build/Makefile
}

make_target() {
  make -C build
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp libretro.so $INSTALL/usr/lib/libretro/pocketsnes_libretro.so
}
