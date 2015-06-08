# Author: Michael Bartl <gnosticus@gmx.at>
# Packager: Samir Faci <csgeek@archlinux.us>
# Maintainer: Arthur Zamarin

pkgname=eclipse-viplugin
pkgver=2.13.1
pkgrel=1
pkgdesc="ViPlugin for Eclipse"
arch=('i686' 'x86_64')
url="http://www.viplugin.com/"
license=('Commercial')
depends=('eclipse')
source=("${url}/files/viPlugin_${pkgver}.zip")
noextract=("viPlugin_${pkgver}.zip")
md5sums=('f4124af1317c76ab5056549c5d3a42c2')

package() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/viPlugin/eclipse
  mkdir -p ${_dest}
  unzip $srcdir/viPlugin_$pkgver.zip -d ${_dest}
}
# vim:set ts=4 sw=4 et:
