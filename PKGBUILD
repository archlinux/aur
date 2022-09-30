# Maintainer: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D

pkgname=firefox-snowflake
pkgver=0.6.1
pkgrel=1
pkgdesc='Firefox extension for a WebRTC pluggable transport for Tor'
url=https://snowflake.torproject.org/
arch=('any')
license=('BSD')
source=("https://addons.mozilla.org/firefox/downloads/file/3979765/torproject_snowflake-$pkgver.xpi")
noextract=("${source##*/}")
sha256sums=('b54630c7a124821cfe24f80110b23b294ef0b92bf18799623a991b47e65e210f')
b2sums=('09410278e8b075061e08dd20be9f12fadb672a33f202aff923abb2a9cc0bf3b4cf3711bd571c21c216303ee7beab2012e1ab64d911921f91e7994ae76af1ce85')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{b11bea1f-a888-4332-8d8a-cec2be7d24b9}.xpi
}

# vim:set ts=2 sw=2 et:
