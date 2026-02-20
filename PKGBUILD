# Maintainer: Matthias Puchstein <matthias at puchstein dot lu>

pkgname=xkb-ultimatekeys
pkgver=2026.02.16
_version=${pkgver//./-}
pkgrel=1
pkgdesc='International US QWERTY keyboard layout with enhanced multilingual support'
arch=(any)
url='https://github.com/pieter-degroote/UltimateKEYS'
license=(GPL-3.0-only)
depends=(xkeyboard-config)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/r$_version.tar.gz")
b2sums=('d5a27e324c5969d313923d81722b533134d4ddd53269203ff6242d087a34f3d62de76e3edc338159a9a3524a4861c516802b3833fd12203a5143292be0949036')

package() {
  cd UltimateKEYS-r$_version

  install -Dm644 linux-xkb/custom "$pkgdir"/usr/share/xkeyboard-config-2/symbols/ultimatekeys
  install -Dm644 linux-xcompose/.XCompose "$pkgdir"/usr/share/ultimatekeys/XCompose
}
