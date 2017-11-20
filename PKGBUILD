# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-decentraleyes
pkgver=2.0.1
pkgrel=1
pkgdesc='Local emulation of Content Delivery Networks.'
url=https://decentraleyes.org/
arch=('any')
license=('custom:MPLv2')
source=("https://github.com/Synzvato/decentraleyes/releases/download/v$pkgver/Decentraleyes.v$pkgver-firefox.xpi")
noextract=("${source##*/}")
sha256sums=('879d3756514ee680c38dfc470d93b023b7fa8d88144e54bf7919d2b10c1ba526')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/jid1-BoFifL9Vbdl2zQ@jetpack.xpi
}

# vim:set ts=2 sw=2 et:
