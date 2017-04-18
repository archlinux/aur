# $Id$
# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=tslint
pkgver=5.1.0
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

sha256sums=('d4b51717acb5dda412e48e33523d214c87ff1e9e7cf3b03703753ba9e4215789')
