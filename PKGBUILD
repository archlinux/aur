# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=mp3guessenc
pkgver=0.26
_ver=0.26preview
pkgrel=1
pkgdesc="A program which guesses which MP3 encoder was used to encode a given MP3 file"
arch=('i686' 'x86_64')
#url="http://shibatch.sourceforge.net/"
url="http://mp3guessenc.sourceforge.net/"
license=('GPL')
depends=('glibc')
makedepends=('unzip')
#source=(http://shibatch.sourceforge.net/download/${pkgname}-${pkgver}.zip)
source=("http://sourceforge.net/projects/mp3guessenc/files/mp3guessenc-$pkgver/mp3guessenc-$_ver.tar.gz/download")
md5sums=('a84226c11f32c2e90949e7a776f8694b')

build() {
  cd "$srcdir/$pkgname-$_ver"
  make
}

package() {
  cd "$srcdir/$pkgname-$_ver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
