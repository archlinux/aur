# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=firefox-vim-vixen
pkgver=0.11
pkgrel=1
pkgdesc='An add-on which allows you to navigate Firefox with vim-like bindings'
url=https://github.com/ueokande/vim-vixen
arch=('any')
license=('MIT')
source=("https://addons.cdn.mozilla.net/user-media/addons/859695/vim_vixen-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('b85d38e73ceefe660e5fda1e99088edc3c180e1feec8e6cd5c05e42fe819ed5d')

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/vim-vixen@i-beam.org.xpi
  }

# vim:set ts=2 sw=2 et:
