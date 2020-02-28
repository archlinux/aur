# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=firefox-vim-vixen
pkgver=0.27
pkgrel=0
pkgdesc="An add-on which allows you to navigate Firefox with vim-like bindings"
url=https://github.com/ueokande/vim-vixen
arch=("any")
license=("MIT")
source=("https://addons.cdn.mozilla.net/user-media/addons/859695/vim_vixen-0.27-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=("95509c736526005d86202987ffeb7f8721499af2bd3337986eb7248fcbe4ce3b")

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/vim-vixen@i-beam.org.xpi
}

# vim:set ts=2 sw=2 et:
