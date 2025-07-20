# Maintainer: Matthias Puchstein <matthias at puchstein dot lu>

pkgname=ultimatekeys
pkgver=2025.04.25
_version=${pkgver//./-}
pkgrel=1
pkgdesc='International US QWERTY keyboard layout with enhanced multilingual support'
arch=(any)
url='https://github.com/pieter-degroote/UltimateKEYS'
license=(GPL-3.0-only)
depends=(xkeyboard-config)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/r$_version.tar.gz")
b2sums=('2b71179a74c6e76ea3dfa8097f40fb5434d21b65329280a8f57330ca829a457fb0dda9fecea8133ee7c31519d4d6d318b47c5a90808540a3b462a0bc8fcceca4')

package() {
  cd UltimateKEYS-r$_version

  install -Dm644 linux-xkb/custom "$pkgdir"/usr/share/xkeyboard-config-2/symbols/ultimatekeys
}
