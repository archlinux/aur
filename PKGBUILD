# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=mp3guessenc
pkgver=0.27.3
pkgrel=1
pkgdesc="A program which guesses which MP3 encoder was used to encode a given MP3 file"
arch=('i686' 'x86_64')
#url="http://shibatch.sourceforge.net/"
url="http://mp3guessenc.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=("https://sourceforge.net/projects/mp3guessenc/files/mp3guessenc-${pkgver/.3/}/mp3guessenc-$pkgver.tar.gz")
md5sums=('a984e1f640b505f4ef295c7130fb2038')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
