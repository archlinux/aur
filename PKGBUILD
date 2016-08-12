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
source=("VimFx-$pkgver.xpi::https://github.com/akhodakivskiy/VimFx/releases/download/v$pkgver/VimFx.xpi")
noextract=("${source%%::*}")
sha256sums=('08810129d749f943f8df735c336f48c6d74336b537a78b14f57d2c6b22ae0506')

package() {
  install -Dm755 ${source%%::*} "$pkgdir"/usr/lib/firefox/browser/extensions/VimFx-unlisted@akhodakivskiy.github.com.xpi
}

# vim:set ts=2 sw=2 et:
