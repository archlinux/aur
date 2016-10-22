# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-vimfx
pkgver=0.20.3
pkgrel=1
pkgdesc='Vim keyboard shortcuts for Firefox'
url=https://github.com/akhodakivskiy/VimFx
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-vimfx')
source=("VimFx-$pkgver.xpi::$url/releases/download/v$pkgver/VimFx.xpi")
noextract=("${source%%::*}")
sha512sums=('271d36771d5d7543a470a6926b0b12395b32b1abac113bc7bbbd2de4dc33bbfc9b3df6283f392da1a013532444ee81973aa87c9467bbb3fdedf9fa39938b5371')

package() {
  install -Dm755 ${source%%::*} "$pkgdir"/usr/lib/firefox/browser/extensions/VimFx-unlisted@akhodakivskiy.github.com.xpi
}

# vim:set ts=2 sw=2 et:
