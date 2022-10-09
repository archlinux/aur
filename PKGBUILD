# Maintainer: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D

pkgname=firefox-snowflake
pkgver=0.6.3
pkgrel=1
pkgdesc='Firefox extension for a WebRTC pluggable transport for Tor'
url=https://snowflake.torproject.org/
arch=('any')
license=('BSD')
source=("https://addons.mozilla.org/firefox/downloads/file/4012423/torproject_snowflake-$pkgver.xpi")
noextract=("${source##*/}")
sha256sums=('51dc0901b066229669ebbca8b51faa57d7fd967c7bf0e475d62c2674af812084')
b2sums=('6dc728442f72249ebc256874933dc5e8f0462a89ca8f2e06fa9fd182ea4717764d5b501a69d1721dcfbece9165a2a8488242302d48ecafbe4bf529d34e1bba2f')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{b11bea1f-a888-4332-8d8a-cec2be7d24b9}.xpi
}

# vim:set ts=2 sw=2 et:
