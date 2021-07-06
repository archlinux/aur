# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=firefox-vim-vixen
pkgver=1.2.1
pkgrel=1
pkgdesc="An add-on which allows you to navigate Firefox with vim-like bindings"
url=https://github.com/ueokande/vim-vixen
arch=("any")
license=("MIT")
source=("https://addons.mozilla.org/firefox/downloads/file/3805318/vim_vixen-1.2.1-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=("4b2a6e9c62f353d8ec0f854c3071aa91cf46221bb2a6731590791ffb775204ec")

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/vim-vixen@i-beam.org.xpi
}

# vim:set ts=2 sw=2 et:
