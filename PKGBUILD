# Maintainer: Matthias Puchstein <matthias at puchstein dot lu>

pkgname=xkb-ultimatekeys
pkgver=2026.06.24
_version=${pkgver//./-}
pkgrel=1
pkgdesc='International US QWERTY keyboard layout with enhanced multilingual support'
arch=(any)
url='https://github.com/pieter-degroote/UltimateKEYS'
license=(GPL-3.0-only)
depends=(xkeyboard-config)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/r$_version.tar.gz")
b2sums=('4b0abcdca2c44a7b6e96e4b013e26026fab785f05b4fc7d6d8f7df8634740a9948ab37565c96bc208f844a8bb7e095f8ef5d93cf0969203df6ec7c0008560272')

package() {
  cd UltimateKEYS-r$_version

  install -Dm644 linux-xkb/custom "$pkgdir"/usr/share/xkeyboard-config-2/symbols/ultimatekeys
  install -Dm644 linux-xcompose/.XCompose "$pkgdir"/usr/share/ultimatekeys/XCompose
}
