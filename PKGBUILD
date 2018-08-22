# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=firefox-vim-vixen
pkgver=0.18
pkgrel=0
pkgdesc="An add-on which allows you to navigate Firefox with vim-like bindings"
url=https://github.com/ueokande/vim-vixen
arch=("any")
license=("MIT")
source=("https://addons.cdn.mozilla.net/user-media/addons/859695/vim_vixen-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=("c9d132393750efcab8735520b5cd45f14c1948161b9a80e98a08973331b8434b")

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/vim-vixen@i-beam.org.xpi
}

# vim:set ts=2 sw=2 et:
