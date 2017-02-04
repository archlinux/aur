# Maintainer: flying sheep <flying-sheep@web.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=nodejs-jsdoc
pkgver=3.4.3
pkgrel=1
pkgdesc="An API documentation generator for JavaScript"
url="https://github.com/jsdoc3/jsdoc"
arch=('any')
license=('APACHE')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/jsdoc/-/jsdoc-$pkgver.tgz")
md5sums=('fb87fcbbd54045a02fb3ce116d44deca')

build() {
	cd "$srcdir/package"
	npm install
}

package() {
	cd "$srcdir/package"
	npm install -g --user root --prefix "$pkgdir/usr"
}
