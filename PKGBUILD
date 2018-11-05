# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-decentraleyes
pkgver=2.0.8
pkgrel=1
pkgdesc='Local emulation of Content Delivery Networks'
url=https://decentraleyes.org/
arch=('any')
license=('MPL2')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/521554/decentraleyes-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('351f369eefc041019efdd5746eeff76e914e316a2dc3c39c726c26c74336dce4')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/jid1-BoFifL9Vbdl2zQ@jetpack.xpi
}

# vim:set ts=2 sw=2 et:
