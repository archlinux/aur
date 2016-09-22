# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-ublock-origin
pkgver=1.9.8
pkgrel=1
pkgdesc='An efficient blocker add-on for various browsers. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock-origin')
replaces=('firefox-extension-ublock-origin')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-fx+tb+an+sm.xpi")
noextract=("${source##*/}")
sha512sums=('f48f8561f5510c7c31f943630ded583b9a500d73b449dc2289e6a8ae61e72ca8f0fdee1bae0ffe0e9823ad11e8b71ec2adb93ffdfe4a51051d059fdaf9072341')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
