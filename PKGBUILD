# Maintainer: p0358 <>
# Contributor: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=libuncso2-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Backend for UnCSO2 (binary release)"
url="https://github.com/harmonytf/libuncso2"
license=('GPL-3.0-only')
arch=('x86_64')
provides=("libuncso2")
conflicts=("libuncso2")
source=("libuncso2-1.2.0.zip::$url/releases/download/v$pkgver/libuncso2-gcc-ubuntu-latest.zip")
sha256sums=('e1494c253eeb895e8c4d4921cf8e0320ed0ef5750632dc85b42a864738dc7261')

package() {
  install -Dm755 libuncso2.so -t "$pkgdir/usr/lib"
  ln -s /usr/lib/libuncso2.so "$pkgdir/usr/lib/libuncso2.so.$pkgver"
}
