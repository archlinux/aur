# Maintainer: CountMurphy <spartan1086 at gmail dot com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=mp3nema
pkgver=0.4
pkgrel=4
pkgdesc="A tool for analyzing and capturing data hidden between frames in an MP3 file or stream"
arch=('i686' 'x86_64')
url="http://www.757labs.org/projects/$pkgname/"
license=('GPL3')
depends=('glibc')
source=(https://github.com/enferex/mp3nema/archive/v0.4.tar.gz)
md5sums=('999bbc16277d83fbd038c1fe21adf01b')

build() {
  cd "$srcdir/$pkgname-0.4" 

  ./configure --prefix=/usr
  make
}
package() {
  install -Dm555 $pkgname-$pkgver/$pkgname "$pkgdir/usr/bin/$pkgname"
}
