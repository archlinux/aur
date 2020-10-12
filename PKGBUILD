# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=firefox-vim-vixen
pkgver=0.31
pkgrel=0
pkgdesc="An add-on which allows you to navigate Firefox with vim-like bindings"
url=https://github.com/ueokande/vim-vixen
arch=("any")
license=("MIT")
source=("https://addons.mozilla.org/firefox/downloads/file/3648399/vim_vixen-0.31-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=("4f87d60db049b39a66fd132ffea360e17063e788edf9af523e291dd075fcdf8d")

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/vim-vixen@i-beam.org.xpi
}

# vim:set ts=2 sw=2 et:
