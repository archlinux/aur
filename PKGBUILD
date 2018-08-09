# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=firefox-vim-vixen
pkgver=0.17
pkgrel=0
pkgdesc="An add-on which allows you to navigate Firefox with vim-like bindings"
url=https://github.com/ueokande/vim-vixen
arch=("any")
license=("MIT")
source=("https://addons.cdn.mozilla.net/user-media/addons/859695/vim_vixen-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=("76cc12a1fb02336a10f71f14102cd0af62b7dcc629b87f3a732bcf6f92bc1e34")

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/vim-vixen@i-beam.org.xpi
}

# vim:set ts=2 sw=2 et:
