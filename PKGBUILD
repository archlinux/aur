# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=firefox-vim-vixen
pkgver=0.24
pkgrel=0
pkgdesc="An add-on which allows you to navigate Firefox with vim-like bindings"
url=https://github.com/ueokande/vim-vixen
arch=("any")
license=("MIT")
source=("https://addons.mozilla.org/firefox/downloads/file/3395145/vim_vixen-0.24-fx.xpi")
noextract=("${source##*/}")
sha256sums=("19555c6b38704035e0cb7635ae20552985c996f4555795d88036bc3830782765")

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/vim-vixen@i-beam.org.xpi
}

# vim:set ts=2 sw=2 et:
