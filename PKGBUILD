# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=skript
pkgver=1.2.1
pkgrel=1
pkgdesc="Fast and minimalist GTK3 markdown editor/viewer"
arch=('x86_64')
url="https://github.com/Twilight0/Skript"
license=('MIT')
depends=('gtk3' 'libportal-gtk3')
makedepends=('gcc' 'make' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Twilight0/Skript/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c8f96a8e2acf27a90dd14cbbc7f7e1cad978e2dc2673798dccc78e878a4ccce5')

build() {
  cd "$srcdir/Skript-$pkgver"
  make
}

package() {
  cd "$srcdir/Skript-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
