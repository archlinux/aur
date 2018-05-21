# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=firefox-vim-vixen
pkgver=0.14
pkgrel=1
pkgdesc="An add-on which allows you to navigate Firefox with vim-like bindings"
url=https://github.com/ueokande/vim-vixen
arch=("any")
license=("MIT")
source=("https://addons.cdn.mozilla.net/user-media/addons/859695/vim_vixen-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=("06e0c1a85b326bb55279420d5cbff7cb100be2de3b09874d83da2e4d968e0a07")

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/vim-vixen@i-beam.org.xpi
}

# vim:set ts=2 sw=2 et:
