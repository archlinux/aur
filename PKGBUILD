# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: joyfulgirl@archlinux.us
# Contributor: nathan owe ndowens04 at gmail dot com

pkgname=cclive
pkgver=0.7.4.1
pkgrel=2
pkgdesc='Commandline downloader for popular video websites.'
arch=('i686' 'x86_64')
url='http://cclive.sourceforge.net/'
license=('GPL3')
depends=('boost-libs' 'quvi')
makedepends=('boost')
source=("http://downloads.sourceforge.net/project/${pkgname}/0.7/${pkgname}-${pkgver}.tar.gz")
md5sums=('5416049225c45c20e4ebe9a6e90a5a58')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
