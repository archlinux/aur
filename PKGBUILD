# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: andreas langer <a.langer@q-dsl.de>

pkgname=libg3d
pkgver=0.0.8
pkgrel=2
pkgdesc="A library for loading and manipulating 3D models from various file formats."
arch=('i686' 'x86_64')
url="http://automagically.de/g3dviewer/"
license=('LGPL')
depends=('gtk2' 'libgsf' 'file' 'flex')
source=("http://automagically.de/files/$pkgname-$pkgver.tar.gz")
md5sums=('23fbb22c24b1db225a3de8b6aaf25774')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

