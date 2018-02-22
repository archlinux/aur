# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-decentraleyes
pkgver=2.0.3
pkgrel=1
pkgdesc='Local emulation of Content Delivery Networks'
url=https://decentraleyes.org/
arch=('any')
license=('custom:MPLv2')
source=("https://github.com/Synzvato/decentraleyes/releases/download/v$pkgver/Decentraleyes.v$pkgver-firefox.xpi")
noextract=("${source##*/}")
sha256sums=('ae29f5684b433773c78b1e31092b389955dbf36db19a0ca47137596f4a44f7ae')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/jid1-BoFifL9Vbdl2zQ@jetpack.xpi
}

# vim:set ts=2 sw=2 et:
