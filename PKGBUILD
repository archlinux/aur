# Maintainer: Cookie Engineer <cookiengineer@protonmail.ch>
# Former Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-extension-ublock-origin
pkgver=1.16.16
pkgrel=1
pkgdesc='An efficient blocker add-on for your browser. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock' 'firefox-extension-ublock-git' 'firefox-extension-ublock-gorhill-git')
source=("https://addons.mozilla.org/firefox/downloads/file/1043725/ublock_origin-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('3a55dd7a742c19a7e39e7778365edcccc23580e97099ae188bbe61c59a8787ed')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
