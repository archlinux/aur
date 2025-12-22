# Maintainer: Jonas Bewig <jomosoto at proton dot me>
pkgname=sc144xx-utils
pkgver=0.1.0_20251222
pkgrel=1
pkgdesc="Tool for running software on sc144xx chips"
arch=('any')
url="https://codeberg.org/CompactCall/sc144xx-utils"
license=('GPL-3.0-or-later')
depends=('python3' 'python-pyserial')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/CompactCall/sc144xx-utils/archive/a9d6ca6cb11b6bd61a842108c6f42625d90e499a.tar.gz")
sha256sums=('f22d8b7805b62d96b82c3570ac577d88fdb6686f124d01059ab4986c0f6105be')

package() {
	cd "$srcdir/sc144xx-utils"
	install -Dm755 sc144xx-utils.py "$pkgdir/usr/bin/sc144xx-utils"
}
