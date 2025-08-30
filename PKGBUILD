# Maintainer: Programador Occidental

pkgname='pass-phrase'
pkgver=1.3
pkgrel=1
pkgdesc='A pass extension to generate passphrases.' 
arch=('any')
url='https://github.com/programadoroccidental/pass-phrase'
license=('GPL3')
depends=('pass')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e5c30e243c2c2faf1b8ea37b20680e9d3b6187418e0c3adf991f633d4d027417e19d4202bd6d0c4f685b4736f923d2706d64e6cdc5b291278d26c2dfd1036a5f')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
