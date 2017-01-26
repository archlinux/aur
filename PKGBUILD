# $Id$
# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=tslint
pkgver=4.4.1
pkgrel=1
pkgdesc="A Linter for the TypeScript language."
arch=('any')
url="http://palantir.github.io/tslint/"
license=('Apache')
depends=('typescript')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
}

sha256sums=('363c17967a92a275d7323937bc0ec66815c047993f18c67926a291708977762f')
