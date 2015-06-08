# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=eclipse-asm
pkgver=1.0.1
pkgrel=3
pkgdesc="A assembler plugin for Eclipse"
url="http://asmplugin.sourceforge.net/"
arch=('any')
license=('GPL')
depends=('eclipse')
makedepends=('unzip')
source=("http://downloads.sourceforge.net/project/asmplugin/ASM%20Plugin/ASM%20Plugin%20Version%20${pkgver}/asm_plugin_${pkgver}.zip")
noextract=('asm_plugin_1.0.1.zip')
sha256sums=('99d5650a90ec4889d45e944659e8874c24087f9c037501fca6929a02e7888e84')

package() {

  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
  mkdir -p ${_dest} || return 1
  cd ${_dest}
  unzip ${srcdir}/asm_plugin_${pkgver}.zip || return 1

}
