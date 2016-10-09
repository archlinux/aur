# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-vimfx
pkgver=0.20.1
pkgrel=1
pkgdesc='Vim keyboard shortcuts for Firefox'
url=https://github.com/akhodakivskiy/VimFx
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-vimfx')
source=("VimFx-$pkgver.xpi::$url/releases/download/v$pkgver/VimFx.xpi")
noextract=("${source%%::*}")
sha512sums=('05d5586589d77aafd63b65203dd10a8489e31dbc88fe3a20c1d6eb657db3d90dbe729d5884b76ddeb49110d0984f1f67ce6acd4b70b79acc8118f52574269d35')

package() {
  install -Dm755 ${source%%::*} "$pkgdir"/usr/lib/firefox/browser/extensions/VimFx-unlisted@akhodakivskiy.github.com.xpi
}

# vim:set ts=2 sw=2 et:
