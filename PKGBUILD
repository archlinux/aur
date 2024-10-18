# Maintainer: Mikicrep <mikicrepcontact@gmail.com>
pkgname=random-file-chooser
pkgver=1.1
pkgrel=1
pkgdesc="This is simple cli tool which can output random file name from specific directory"
arch=('x86_64')
url="https://github.com/Mikicrepstudios/random-file-chooser"
license=('MIT')
depends=('gcc' 'make')
makedepends=('git')
source=("git+https://github.com/Mikicrepstudios/random-file-chooser.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 random-file-chooser "$pkgdir/usr/bin/random-file-chooser"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

