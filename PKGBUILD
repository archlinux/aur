# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-decentraleyes
pkgver=2.0.2
pkgrel=1
pkgdesc='Local emulation of Content Delivery Networks'
url=https://decentraleyes.org/
arch=('any')
license=('custom:MPLv2')
source=("https://github.com/Synzvato/decentraleyes/releases/download/v$pkgver/Decentraleyes.v$pkgver-firefox.xpi")
noextract=("${source##*/}")
sha256sums=('24c31df05f1d667911260d31cc386f858bffe48f32345015e5e2db7a26d4b52f')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/jid1-BoFifL9Vbdl2zQ@jetpack.xpi
}

# vim:set ts=2 sw=2 et:
