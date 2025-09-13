# Maintainer: Matthias Puchstein <matthias at puchstein dot lu>

pkgname=xkb-ultimatekeys
pkgver=2025.09.06
_version=${pkgver//./-}
pkgrel=1
pkgdesc='International US QWERTY keyboard layout with enhanced multilingual support'
arch=(any)
url='https://github.com/pieter-degroote/UltimateKEYS'
license=(GPL-3.0-only)
depends=(xkeyboard-config)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/r$_version.tar.gz")
b2sums=('f0a1188383e362f6b617407d29972918cd19c3620cf05539ee814b29428171270702fbdbf0ad6dd0f721cd09f42927585d6df4e03c93907b686cbb1f8bf9da02')

package() {
  cd UltimateKEYS-r$_version

  install -Dm644 linux-xkb/custom "$pkgdir"/usr/share/xkeyboard-config-2/symbols/ultimatekeys
  install -Dm644 linux-xcompose/.XCompose "$pkgdir"/usr/share/ultimatekeys/XCompose
}
