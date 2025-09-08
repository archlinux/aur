# Maintainer: Matthias Puchstein <matthias at puchstein dot lu>

pkgname=xkb-ultimatekeys
pkgver=2025.08.14
_version=${pkgver//./-}
pkgrel=1
pkgdesc='International US QWERTY keyboard layout with enhanced multilingual support'
arch=(any)
url='https://github.com/pieter-degroote/UltimateKEYS'
license=(GPL-3.0-only)
depends=(xkeyboard-config)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/r$_version.tar.gz")
b2sums=('89e01686d4b03ec8af393da4ca83a4fa2ba6b93f0fa7618d0d6fea6d5773aaa9433d4e0a957c048ba980039a6b26ccea7043c99f0baefb2add4d1f656fa68083')

package() {
  cd UltimateKEYS-r$_version

  install -Dm644 linux-xkb/custom "$pkgdir"/usr/share/xkeyboard-config-2/symbols/ultimatekeys
  install -Dm644 linux-xcompose/.XCompose "$pkgdir"/usr/share/ultimatekeys/XCompose
}
