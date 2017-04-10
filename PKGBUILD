# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-decentraleyes
pkgver=1.3.8
pkgrel=1
pkgdesc='Local emulation of Content Delivery Networks.'
url=https://github.com/Synzvato/decentraleyes
arch=('any')
license=('custom:MPLv2')
source=("$url/releases/download/v$pkgver/Decentraleyes.v$pkgver-firefox.xpi")
noextract=("${source##*/}")
sha512sums=('b2f5bec24dbc1ca257794deb58f7947d2ca029d5c670f174ce856975b7940459acee87328ccbe3fe1ed19d45adfa2be09883af2cbc272b2c5f9a29bb10c6b1ee')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/jid1-BoFifL9Vbdl2zQ@jetpack.xpi
}

# vim:set ts=2 sw=2 et:
