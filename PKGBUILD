# Maintainer: Leo Layout <tu@email.com>
pkgname=taskie
pkgver=1.0.0
pkgrel=1
pkgdesc="Gestor de tareas CLI estilo git, hecho en C++"
arch=('x86_64')
url="https://github.com/Espoachan/taskie"
license=('MIT')
depends=()
makedepends=('git' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  g++ -std=c++17 -O2 -o taskie main.cpp
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/taskie" "$pkgdir/usr/bin/taskie"
}
