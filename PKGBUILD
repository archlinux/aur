# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=libosmpbf
pkgver=1.3.3
pkgrel=2
pkgdesc="A library to support OpenStreetMap's protocolbuffer binary format (OSM PBF)"
arch=('i686' 'x86_64')
url="https://github.com/scrosby/OSM-binary"
license=('LGPL3')
depends=('protobuf')
makedepends=('git')
_gitname='OSM-binary'
source=("https://github.com/scrosby/$_gitname/archive/v$pkgver.zip")

build() {
  cd "$srcdir/$_gitname-$pkgver/src"
  make
}

package() {
  cd "$srcdir/$_gitname-$pkgver/src"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

md5sums=('4d759ee2f4ecdf47487f711c91dd5829')
sha1sums=('d8362d14cb8134975c169d396e0e1163c4a4f897')
sha256sums=('171c2d7e81320315e53b6fe6bfa791866b18451124ff11042fd533b7e399da5b')
sha512sums=('13b633c6b4edb59131dd89c52e1742c207b471c65694112766b8c3bf0d488bd060e964c7e11c2c139f19d31373af45e3ccb3ca45b3e9e7b62ed8a50c594d011c')
