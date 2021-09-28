# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=firefox-vim-vixen
pkgver=1.2.3
pkgrel=1
pkgdesc="An add-on which allows you to navigate Firefox with vim-like bindings"
url=https://github.com/ueokande/vim-vixen
arch=("any")
license=("MIT")
source=("https://addons.mozilla.org/firefox/downloads/file/3845233/vim_vixen-1.2.3-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=("8f86c77ac8e65dfd3f1a32690b56ce9231ac7686d5a86bf85e3d5cc5a3a9e9b5")

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/vim-vixen@i-beam.org.xpi
}

# vim:set ts=2 sw=2 et:
