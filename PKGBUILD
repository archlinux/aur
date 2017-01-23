# $Id$
# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=tslint
pkgver=4.3.1
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

sha256sums=('51585c29e4ea310f8bea4c84abbf3ee1a4d37fa33cc382ffefc5f0b71d76cc34')
