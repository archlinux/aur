# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=firefox-vim-vixen
pkgver=1.0.1
pkgrel=1
pkgdesc="An add-on which allows you to navigate Firefox with vim-like bindings"
url=https://github.com/ueokande/vim-vixen
arch=("any")
license=("MIT")
source=("https://addons.mozilla.org/firefox/downloads/file/3751589/vim_vixen-1.0.1-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=("60172f35ccc2d092bc1e21c43ec990dc40733b4aa3d5a6b66e54d04004d1b02e")

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/vim-vixen@i-beam.org.xpi
}

# vim:set ts=2 sw=2 et:
