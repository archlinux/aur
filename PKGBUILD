# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-vimfx
pkgver=0.18.1
pkgrel=1
pkgdesc='Vim keyboard shortcuts for Firefox'
url=https://github.com/akhodakivskiy/VimFx
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-vimfx')
source=("VimFx-$pkgver.xpi::https://github.com/akhodakivskiy/VimFx/releases/download/v$pkgver/VimFx.xpi")
noextract=("${source%%::*}")
sha256sums=('3bccc26506e40c05ff7af32a82a2b529995f8c1ed84e471caf01734d54047d8c')

package() {
  install -Dm755 ${source%%::*} "$pkgdir"/usr/lib/firefox/browser/extensions/VimFx-unlisted@akhodakivskiy.github.com.xpi
}

# vim:set ts=2 sw=2 et:
