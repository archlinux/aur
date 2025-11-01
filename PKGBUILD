# Maintainer: Yukari Hafner <shinmera@tymoon.eu>
pkgname=ttf-promptfont
pkgver=1.12
pkgrel=1
pkgdesc="A font for button prompts and glyphs in games and game-related applications"
arch=('any')
url="https://shinmera.com/promptfont"
license=('OFL-1.0')
source=("https://shinmera.com/projects/promptfont/releases/download/v$pkgver/promptfont.zip")
sha1sums=('ffd13bf5979f953a9ff007c69cda093a0af47715')

package() {
    install -Dm644 *.ttf \
            -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 *.otf \
            -t "${pkgdir}/usr/share/fonts/OTF"
    install -Dm644 LICENSE.txt \
            -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 README.md index.html promptfont.css index.css tags.txt preview.png \
            -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 glyphs.json tags.txt promptfont.txt promptfont.css promptfont.h promptfont.cs promptfont.py promptfont.lisp promptfont.lua promptfont.rs promptfont.gd promptfont.gml atlas*.png \
            -t "${pkgdir}/usr/share/${pkgname}"
}
