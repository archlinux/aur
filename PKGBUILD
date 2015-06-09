# Maintainer: Giovanni Scafora <giovanni@archlinux.org>

pkgname=rfidtool
pkgver=0.01
pkgrel=1
pkgdesc="A opensource tool to read / write rfid tags"
arch=('i686' 'x86_64')
url="http://www.bindshell.net/tools/rfidtool.html"
license=('GPL')
depends=('glibc') 
source=("http://www.pkgbuild.com/~giovanni/${pkgname}-v${pkgver}.tar.bz2") 
md5sums=('de95d6855e2f29ed38e986602c9299e7')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  
  install -Dm755 rfidtool "${pkgdir}/usr/bin/rfidtool"
}
