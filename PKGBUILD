# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-vimfx
pkgver=0.17.4
pkgrel=2
pkgdesc='Vim keyboard shortcuts for Firefox'
url=https://github.com/akhodakivskiy/VimFx
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-vimfx')
source=("https://addons.mozilla.org/firefox/downloads/file/466439/vimfx-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('af44d4a6ca6e0ae6d5fd33b9ff29c4aaaf71271f20073b7ddc44fbab4e1168c0')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/VimFx@akhodakivskiy.github.com.xpi
}

# vim:set ts=2 sw=2 et:
