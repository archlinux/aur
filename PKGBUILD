# $Id$
# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=tslint
pkgver=4.2.0
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

sha256sums=('7d3e2c7c2a0afca41be6b4c67c6adab8b4c012f3eab4a79d606cd367aa102cd1')
# vim:set ts=2 sw=2 et:
