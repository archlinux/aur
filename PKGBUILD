# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-decentraleyes
pkgver=2.0.4
pkgrel=1
pkgdesc='Local emulation of Content Delivery Networks'
url=https://decentraleyes.org/
arch=('any')
license=('MPL2')
groups=('firefox-addons')
source=("https://github.com/Synzvato/decentraleyes/releases/download/v$pkgver/Decentraleyes.v$pkgver-firefox.xpi")
noextract=("${source##*/}")
sha256sums=('62963d86aa6b559830a07f49a3e41dc7727259a7ddafec40d444387824abc636')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/jid1-BoFifL9Vbdl2zQ@jetpack.xpi
}

# vim:set ts=2 sw=2 et:
