# Maintainer: Chris Chamberlain <chris at chamberlain dot id dot au>
pkgname=otf-fira-code-symbol
pkgver=1.206
pkgrel=2
pkgdesc="Fira Code: monospaced font with programming ligatures (symbol font)."
arch=('any')
url='https://github.com/tonsky/FiraCode/issues/211#issuecomment-239058632'
license=('custom:OFL')
depends=('fontconfig')
source=('https://github.com/tonsky/FiraCode/files/412440/FiraCode-Regular-Symbol.zip')
md5sums=('aa76674049761a31d20379679d6a32b3')

package() {
    # Prepare destination directory
    install -dm755 "$pkgdir/usr/share/fonts/OTF"

    # Install fonts
    install -m644 "FiraCode-Regular-Symbol.otf" "$pkgdir/usr/share/fonts/OTF"
}
