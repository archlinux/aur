# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-vimfx
pkgver=0.20.5
pkgrel=1
pkgdesc='Vim keyboard shortcuts for Firefox'
url=https://github.com/akhodakivskiy/VimFx
arch=('any')
license=('GPL3')
source=("VimFx-$pkgver.xpi::$url/releases/download/v$pkgver/VimFx.xpi")
noextract=("${source%%::*}")
sha512sums=('75016244ee61579edd7a65f20d7047353ebf3d2447870a53c5b9086cb341d077e7d6a36825b0e16084ab1e9c18df430f9a3ffc585778e4b6a6d2e02e6c99ce71')

package() {
  install -Dm644 ${source%%::*} "$pkgdir"/usr/lib/firefox/browser/extensions/VimFx-unlisted@akhodakivskiy.github.com.xpi
}

# vim:set ts=2 sw=2 et:
