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
sha512sums=('a4945b716c36672d3efd4d10d83fcbe8f9c6181ce1529fb22e61b2f3c6c18a182e7857bf0ae495a857a36ff0c12336b5ba8317bdd26642efbc77eb4b21ab1cad')

package() {
  install -Dm755 ${source%%::*} "$pkgdir"/usr/lib/firefox/browser/extensions/VimFx-unlisted@akhodakivskiy.github.com.xpi
}

# vim:set ts=2 sw=2 et:
