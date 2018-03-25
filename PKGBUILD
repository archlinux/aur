# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=firefox-vim-vixen
pkgver=0.12
pkgrel=1
pkgdesc="An add-on which allows you to navigate Firefox with vim-like bindings"
url=https://github.com/ueokande/vim-vixen
arch=("any")
license=("MIT")
source=("https://addons.cdn.mozilla.net/user-media/addons/886219/vim_vixen-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=("3fc09aba9bdb6a06d8accb8d1ab669f1a004aa27abbcdc2dffc0b8b5381af646")

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/vim-vixen@i-beam.org.xpi
  }

# vim:set ts=2 sw=2 et:
