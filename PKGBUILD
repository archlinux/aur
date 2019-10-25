# Maintainer: Ondřej Šponar

pkgname=lexend-font-family-git
pkgver=1.0
pkgrel=1
pkgdesc='Lexend is a variable typeface designed to improve reading fluency'
url="https://lexend.com"
arch=(any)
license=(custom:OFL-1.1)
makedepends=('git')
provides=('lexend-font-family-git')
source=('lexend-font-family-git::git+https://github.com/ThomasJockin/lexend')
sha256sums=('SKIP')

package() {
install -Dm644 $pkgname/fonts/ttf/LexendDeca-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendDeca-Regular.ttf"
install -Dm644 $pkgname/fonts/ttf/LexendExa-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendExa-Regular.ttf"
install -Dm644 $pkgname/fonts/ttf/LexendGiga-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendGiga-Regular.ttf"
install -Dm644 $pkgname/fonts/ttf/LexendMega-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendMega-Regular.ttf"
install -Dm644 $pkgname/fonts/ttf/LexendPeta-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendPeta-Regular.ttf"
install -Dm644 $pkgname/fonts/ttf/LexendTera-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendTera-Regular.ttf"
install -Dm644 $pkgname/fonts/ttf/LexendZetta-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendZetta-Regular.ttf"
install -Dm644 $pkgname/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
