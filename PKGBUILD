# Maintainer: progoccidental

pkgname='pass-phrase'
pkgver=1.1
pkgrel=1
pkgdesc='A pass extension to generate passphrases.' 
arch=('any')
url='https://github.com/programadoroccidental/pass-phrase'
license=('GPL3')
depends=('pass')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('5e64cf24ddd244482665786f14054fdc83b23123dc32c7bac8f661d9913f00b9d9111b26fa282b0f75b0b933e42a8bf0557513e2e26ffb82ecfb1ad388320602')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
