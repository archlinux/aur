# Maintainer: Monsieur Tino <waste@mrtino.eu>

pkgname=gilbert
pkgver=1.002
pkgrel=1
desc="Font made in tribute of Gilbert Baker, creator of the Rainbow Flag. Two .otf files are available, only one is available here because it is compatible system-wide."
url="https://www.typewithpride.com/"
arch=(any)
license=(custom)
source=("https://github.com/Fontself/TypeWithPride/archive/$pkgver.tar.gz")
sha256sums=('5b8d048de3afefa135bb8048b9f8c735c61727f4ec16a1bd477663e4342c13ae')

package() {
    cd TypeWithPride-$pkgver
    install -d "$pkgdir/usr/share/fonts/gilbert"
    install -t "$pkgdir/usr/share/fonts/gilbert" -m644 fonts/Gilbert-Bold-Preview_1002.otf
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
