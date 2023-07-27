# Maintainer: David Runge <dvzrv@archlinux.org>

_name=FST
pkgname=fst
pkgver=0.123.0
pkgrel=1
pkgdesc="Free Studio Technology"
arch=(any)
url="https://git.iem.at/zmoelnig/FST"
license=(GPL3)
source=(https://git.iem.at/zmoelnig/$_name/-/archive/v$pkgver/$_name-v$pkgver.tar.gz)
sha512sums=('f4fcdc0e4f0e3e6f231969c69464c56e6eb1134ea73a770db5348a514d06263c9d98bcf67260e91b59c727ad3e0f160ff45383221c3f0afc3ff775e5576f3af7')
b2sums=('fa987375c2874e152393dcc7be584606ff818a76a231f36f33e9eb69820da34fdbf3da6c917164454c5ba47fe5f457e53cef340ffcf404cb6cfeae25339f998c')

package() {
  cd $_name-v$pkgver
  install -vDm 644 fst/*.h -t "$pkgdir/usr/include/pluginterface/$pkgname/"
  install -vDm 644 README.md docs/* -t "$pkgdir/usr/share/doc/$pkgname/"
}
