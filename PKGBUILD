# Maintainer: Mikicrep <mikicrepcontact@gmail.com>
pkgname=random-gibberish-generator
pkgver=1.3
pkgrel=1
pkgdesc="This is simple CLI tool that can generate strings of random characters and put in file"
arch=('x86_64')
url="https://github.com/Mikicrepstudios/random-gibberish-generator"
license=('MIT')
depends=('gcc' 'make')
makedepends=('git')
source=("git+https://github.com/Mikicrepstudios/random-gibberish-generator.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 random-gibberish-generator "$pkgdir/usr/bin/random-gibberish-generator"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

