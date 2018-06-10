# Maintainer: Dopustim Vladimir <dopustimvladimir@gmail.com>

pkgname=aspell6-ky
pkgver=0.01
pkgrel=1
pkgdesc="Kyrgyz dictionary for aspell"
arch=("any")
depends=("aspell>=0.60")
url="http://aspell.net/"
license=("GPL")
source=(ftp://ftp.gnu.org/gnu/aspell/dict/ky/${pkgname}-${pkgver}-0.tar.bz2)
md5sums=(83ed490464521361867546f9ad4cbaf2)

build() {
  cd ${pkgname}-${pkgver}-0
  ./configure
  make
}

package() {
  cd ${pkgname}-${pkgver}-0
  make DESTDIR=${pkgdir} install
}
