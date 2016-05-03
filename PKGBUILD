# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=oclint-json-compilation-database
pkgver=0.7
pkgrel=1
pkgdesc="A helper program that filters information from compile_command.json and
invoke OCLint for static code analysis "
arch=('i686' 'x86_64')
url="http://oclint.org/docs/manual/oclint-json-compilation-database.html"
license=('BSD')
dependencies=('python2')
source=("https://github.com/oclint/oclint-json-compilation-database/archive/v${pkgver}.tar.gz")
md5sums=('82b5c3f5e7bb1651d6122c57af4532a4')

package() {
	cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/bin
  install -m 755 oclint-json-compilation-database $pkgdir/usr/bin/oclint-json-compilation-database
}
