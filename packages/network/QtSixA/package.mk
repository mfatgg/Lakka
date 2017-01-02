################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="QtSixA"
PKG_VERSION="1.5.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://qtsixa.sourceforge.net/"
PKG_URL="$SOURCEFORGE_SRC/qtsixa/$PKG_NAME%20$PKG_VERSION/$PKG_NAME-$PKG_VERSION-src.tar.gz"
#http://downloads.sourceforge.net/project/qtsixa/QtSixA%201.5.1/QtSixA-1.5.1-src.tar.gz
PKG_DEPENDS_TARGET="toolchain bluez"
PKG_PRIORITY="optional"
PKG_SECTION="network"
PKG_SHORTDESC="sixad: ps3 bluetooth devices"
PKG_LONGDESC="ps3 bluetooth devices."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"


make_target() {
  make -C sixad
  chmod +x sixad/sixad
  make -C utils
}

makeinstall_target() {
  mkdir -p $INSTALL/etc/default
    cp -PR sixad/sixad.default $INSTALL/etc/default/sixad

  mkdir -p $INSTALL/usr/bin
    cp -PR sixad/sixad $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/sbin
    cp -PR sixad/bins/sixad* $INSTALL/usr/sbin
    cp -PR sixad/sixad-dbus-blocker $INSTALL/usr/sbin
    cp -PR utils/bins/sixpair $INSTALL/usr/sbin/
    cp -PR utils/bins/sixpair-kbd $INSTALL/usr/sbin/
    cp -PR utils/bins/hidraw-dump $INSTALL/usr/sbin/

  mkdir -p $INSTALL/var/lib/sixad/profiles
}

post_install() {
  enable_service sixad.service
}
