# $Id$
# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=tslint
pkgver=5.11.0
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
}

sha256sums=('b2016e35464f38722fa8939dcec49a3c54a7550c5aed4f952af7bdd9a3b813c4')
