# Maintainer: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D

pkgname=firefox-snowflake
pkgver=0.7.0
pkgrel=1
pkgdesc='Firefox extension for a WebRTC pluggable transport for Tor'
url=https://snowflake.torproject.org/
arch=('any')
license=('BSD')
source=("https://addons.mozilla.org/firefox/downloads/file/4029067/torproject_snowflake-$pkgver.xpi")
noextract=("${source##*/}")
sha256sums=('ff6211ebcbf1ac9352e31845a974f28a9bb7faea749bab96a1e0eee2efe39ea5')
b2sums=('37a28003100dacac40b599fba1e8148d2e0531dff2eac504ffa579fec1860e4642319e72ba63a1f85aae194237e071152491f1b5a9f77b1c1a7c38d7d7a690fb')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{b11bea1f-a888-4332-8d8a-cec2be7d24b9}.xpi
}

# vim:set ts=2 sw=2 et:
