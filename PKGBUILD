# Maintainer: progoccidental

pkgname='pass-phrase'
pkgver=1.0
pkgrel=1
pkgdesc='A pass extension to generate passphrases.' 
arch=('any')
url='https://github.com/programadoroccidental/pass-phrase'
license=('GPL3')
depends=('pass')
source=("https://github.com/programadoroccidental/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('f1bab43639b11947a61de184a19d13de38da8f392fdd9c8fcce2c980a16f84112a50cce8679b71ce3b1bc7581a28b121938e9ed04727ef949c314487a817eb38')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
