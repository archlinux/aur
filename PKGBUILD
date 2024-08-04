# Maintainer: Tony M.J. <tonymj@proton.me>
pkgname=xlsxio
pkgver="0.2.35"
pkgrel=1
pkgdesc="C library for reading and writing .xlsx files"
arch=('x86_64')
provides=('xlsxio')
url=https://github.com/brechtsanders/xlsxio
license=('MIT')
depends=('expat' 'minizip')
source=("$url/releases/download/$pkgver/xlsxio-$pkgver.tar.xz")
sha256sums=('b42abf540449767832e285e79014cd2339a94613f7a63567c4118182798d55d3')

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX=$pkgdir/usr
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
