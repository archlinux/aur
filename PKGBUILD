# Maintainer: Jonas Bewig <jomosoto at proton dot me>
pkgname=sc144xx-utils
pkgver=0.1.0_20260129
pkgrel=1
pkgdesc="Tool for running software on sc144xx chips"
arch=('any')
url="https://codeberg.org/CompactCall/sc144xx-utils"
license=('GPL-3.0-or-later')
depends=('python3' 'python-pyserial')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/CompactCall/sc144xx-utils/archive/5c4d8a9222e37d0396409eb00b75dcbf94a9a3f2.tar.gz")
sha256sums=('39c61093cb8a978c93eadc79b5b36cfaddae4d1c6ad420838686d437f5f7c203')

package() {
	cd "$srcdir/sc144xx-utils"
	install -Dm755 sc144xx-utils.py "$pkgdir/usr/bin/sc144xx-utils"
}
