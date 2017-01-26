# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-decentraleyes
pkgver=1.3.7
pkgrel=1
pkgdesc='Local emulation of Content Delivery Networks.'
url=https://addons.mozilla.org/en-US/firefox/addon/decentraleyes/
arch=('any')
license=('custom:MPLv2')
source=("https://addons.cdn.mozilla.net/user-media/addons/521554/decentraleyes-$pkgver-an+fx+sm.xpi")
noextract=("${source##*/}")
sha512sums=('29c50d835a98a69f265dff9e2c37726ef778d8ec73c402f9a3755ba3a8be52cb50ffe40039293d5679bc3524d32fc792950e9337b3e409dab39e8a3a1b10b423')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/jid1-BoFifL9Vbdl2zQ@jetpack.xpi
}

# vim:set ts=2 sw=2 et:
