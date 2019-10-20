# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sigitas Mazaliauskas <sigisnn@gmail.com>

pkgname=pngcodec
pkgver=r15435
pkgrel=2
pkgdesc="Tool to add meta-data to PNG files"
arch=('i686' 'x86_64')
url="http://wiki.openttd.org/PNGCodec"
license=('GPL2')
makedepends=('gcc6')
source=("http://binaries.openttd.org/extra/${pkgname}/${pkgver}/${pkgname}-${pkgver}-source.tar.bz2")
md5sums=('bdc6bc9ed43873c0f6a07556fab2a9ff')

build() {
  cd ${pkgname}-${pkgver}
  make CXX=g++-6
}

package() {
  install -Dm755 "$srcdir"/${pkgname}-${pkgver}/${pkgname} \
	  "$pkgdir"/usr/bin/${pkgname}
} 
