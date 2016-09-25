# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-vimfx
pkgver=0.19.0
pkgrel=1
pkgdesc='Vim keyboard shortcuts for Firefox'
url=https://github.com/akhodakivskiy/VimFx
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-vimfx')
source=("VimFx-$pkgver.xpi::$url/releases/download/v$pkgver/VimFx.xpi")
noextract=("${source%%::*}")
sha256sums=('0fdf9484a2fe9efc5c024b2f2f881e201a77fe35873266df51647639599057e9')

package() {
  install -Dm755 ${source%%::*} "$pkgdir"/usr/lib/firefox/browser/extensions/VimFx-unlisted@akhodakivskiy.github.com.xpi
}

# vim:set ts=2 sw=2 et:
