# Maintainer: Matthias Puchstein <matthias at puchstein dot lu>

pkgname=xkb-ultimatekeys
pkgver=2026.02.24
_version=${pkgver//./-}
pkgrel=1
pkgdesc='International US QWERTY keyboard layout with enhanced multilingual support'
arch=(any)
url='https://github.com/pieter-degroote/UltimateKEYS'
license=(GPL-3.0-only)
depends=(xkeyboard-config)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/r$_version.tar.gz")
b2sums=('5b35c755ebef715d87d7d10940feb310fd991147ea94f1c115d3b8fc70aa051dcaf0edb64e8890000bbf50ac6ff1e14d45c3cbd875c46e3081704f9d24f0a9f6')

package() {
  cd UltimateKEYS-r$_version

  install -Dm644 linux-xkb/custom "$pkgdir"/usr/share/xkeyboard-config-2/symbols/ultimatekeys
  install -Dm644 linux-xcompose/.XCompose "$pkgdir"/usr/share/ultimatekeys/XCompose
}
