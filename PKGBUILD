# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-decentraleyes
pkgver=2.0.0
pkgrel=1
pkgdesc='Local emulation of Content Delivery Networks.'
url=https://decentraleyes.org/
arch=('any')
license=('custom:MPLv2')
source=("https://github.com/Synzvato/decentraleyes/releases/download/v$pkgver/Decentraleyes.v$pkgver-firefox.xpi")
noextract=("${source##*/}")
sha512sums=('44db5d423f969ed0fbcb9b915628b9ea4cb6a37b458aa4b7617aebc3d3e2a680cb0884272471caeb37072129583346e31d07d56e820ef9fc98d6614eeba6c43f')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/jid1-BoFifL9Vbdl2zQ@jetpack.xpi
}

# vim:set ts=2 sw=2 et:
