# Maintainer: David Runge <dvzrv@archlinux.org>

_name=FST
pkgname=fst
pkgver=0.122.0
pkgrel=1
pkgdesc="Free Studio Technology"
arch=(any)
url="https://git.iem.at/zmoelnig/FST"
license=(GPL3)
source=(https://git.iem.at/zmoelnig/$_name/-/archive/v$pkgver/$_name-v$pkgver.tar.gz)
sha512sums=('0a199fde0894bda7ecb78b8b534c85fa7ca4c2d2eec2ccee2e76b4b4b60fd19f908c234227baed94d9f94b30d33ce69ec8e7947b4d040930477c2abf1e3fc781')
b2sums=('32b94edd06bc0b92a2ecf78fa677b45b8acd37edc56f564a8f693128c4bde7be6e8ef516eeb25943237db88a3d91b5b3dca91c8a5569f54d3d34e6e9e126a924')

package() {
  cd $_name-v$pkgver
  install -vDm 644 fst/*.h -t "$pkgdir/usr/include/pluginterface/$pkgname/"
  install -vDm 644 README.md docs/* -t "$pkgdir/usr/share/doc/$pkgname/"
}
