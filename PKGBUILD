# Maintainer: progoccidental

pkgname='pass-phrase'
pkgver=1.0.1
pkgrel=1
pkgdesc='A pass extension to generate passphrases.' 
arch=('any')
url='https://github.com/programadoroccidental/pass-phrase'
license=('GPL3')
depends=('pass')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d66177cf26f3b2d18c55b03a04a4095666e3e22e5ea9e3c29dba9d2704ebc168c26a25c17e1f1cd628a776767ebb3a5f1701075fc9d2631af746551893d30fca')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
