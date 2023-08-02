# Maintainer:  Joakim Repomaa <aur@j.repomaa.com>
pkgname=('ttf-hack-nerd-font')
_fontname='Hack'
pkgver='3.0.2'
pkgrel=1
pkgdesc="Hack font patched with Merd font glyphs"
url="https://nerdfonts.com"
license=('MIT' 'custom')
arch=('any')
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/${_fontname}.zip")
sha256sums=('e9e620aa5c9a02ae60cc41e959bf74b29592f9efd64235ed9b93abfa448674a1')

package() {
    cd "$srcdir"
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" *.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
