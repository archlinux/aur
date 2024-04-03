# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-creepster
pkgver=1.000
pkgrel=2
_commit=90d7886db9000c893b9559828bf028aaed5f9c10
pkgdesc='Scary font with capital letters'
arch=(any)
url="https://fonts.google.com/specimen/Creepster"
license=(OFL-1.1-RFN)
source=("https://github.com/google/fonts/raw/$_commit/ofl/creepster/OFL.txt"
        "https://github.com/google/fonts/raw/$_commit/ofl/creepster/Creepster-Regular.ttf")
sha256sums=('c09e3b81d9cfeec46bc29a3374000e8ad013d694bdf24a288088491dd4cd5c69'
            '402aeb734586c74aecd3dbdc454589b1fb12e2e1c71f782fd019ae68066d9f44')

package() {
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" *.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
