# Maintainer: oceanthunder <admin@oceanthunder.dev>
pkgname=ttf-vt323
pkgver=1.001
pkgrel=1
pkgdesc="Monospaced typeface designed to look like the VT320 text terminal glyphs."
arch=('any')
url="https://github.com/phoikoi/VT323/"
license=('OFL')
depends=('fontconfig')
provides=('ttf-font')
source=("https://github.com/phoikoi/VT323/raw/master/fonts/ttf/VT323-Regular.ttf"
        "https://github.com/phoikoi/VT323/raw/master/OFL.txt")
sha256sums=('cf4de751ada78ceac033dbe16a687742939995b77bc2a052ae17a4957958594d'
            '27d9af34210253e7ca1251fbace86c6f65b40031d6ce1a75493a1b2093631298')
package() {
  install -Dm644 "VT323-Regular.ttf" "$pkgdir/usr/share/fonts/TTF/VT323-Regular.ttf"
  install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

