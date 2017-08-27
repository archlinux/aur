# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-decentraleyes
pkgver=1.3.10
pkgrel=1
pkgdesc='Local emulation of Content Delivery Networks.'
url=https://decentraleyes.org/
arch=('any')
license=('custom:MPLv2')
source=("https://github.com/Synzvato/decentraleyes/releases/download/v$pkgver/Decentraleyes.v$pkgver-firefox.xpi")
noextract=("${source##*/}")
sha512sums=('94745f7aeb19d3384ce6c994c289d8db50bbce5e51cf251ccf8d124f9e87a05c1a974aa60c4ee1d87a46d14cee2a70c36457001456ceb075469dbee41ef6261e')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/jid1-BoFifL9Vbdl2zQ@jetpack.xpi
}

# vim:set ts=2 sw=2 et:
