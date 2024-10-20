# Maintainer: Mikicrep <mikicrepcontact@gmail.com>
pkgname=githttptossh
pkgver=1.0
pkgrel=1
pkgdesc="Too lazy to change git remote origin to ssh? Try this"
arch=('x86_64')
url="https://github.com/Mikicrepstudios/githttpossh"
license=('MIT')
makedepends=('git')
source=("git+https://github.com/Mikicrepstudios/githttptossh.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 githttptosh.sh "$pkgdir/usr/bin/githttptossh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

