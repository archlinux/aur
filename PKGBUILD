# Maintainer: RickaPrincy <rckprincy@gmail.com>

pkgname=dumb_types_header
pkgver=1.0.0
pkgrel=1
pkgdesc="Header-only C++ library providing convenient data types (header only)"
arch=('any')
url="https://github.com/RickaPrincy/dumb_types"
license=('MIT')

source=("dumb_types_header.tar.gz::https://github.com/RickaPrincy/dumb_types/releases/download/v$pkgver/dumb_types_header.tar.gz")
sha256sums=("8e430de8a1a388cfcc4b642842dffcf101aade9ea618d95d2df68b68e39cc649")

package() {
  mkdir -p "$pkgdir/usr/include"
  tar -xzf "$srcdir/dumb_types_header.tar.gz" -C "$pkgdir/usr/include" 
}
