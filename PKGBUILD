# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-vimfx
pkgver=0.20.10
pkgrel=1
pkgdesc='Vim keyboard shortcuts for Firefox'
url=https://github.com/akhodakivskiy/VimFx
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("VimFx-$pkgver.xpi::$url/releases/download/v$pkgver/VimFx.xpi")
noextract=("${source%%::*}")
sha512sums=('99807a1cf7827258b04e739081b209092479f76462a4b4501d23aa1738b81ddd5078ced2d718d30238780cc38651b8a31803ced1dde0d7371377af7eb1593d27')

package() {
  install -Dm644 ${source%%::*} "$pkgdir"/usr/lib/firefox/browser/extensions/VimFx-unlisted@akhodakivskiy.github.com.xpi
}

# vim:set ts=2 sw=2 et:
