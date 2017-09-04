# Maintainer: flying sheep <flying-sheep@web.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=nodejs-jsdoc
pkgver=3.5.4
pkgrel=1
pkgdesc="An API documentation generator for JavaScript"
url="https://github.com/jsdoc3/jsdoc"
arch=('any')
license=('APACHE')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/jsdoc/-/jsdoc-$pkgver.tgz")
md5sums=('72a60c37d3de05ef9b772cea79bc2d85')

build() {
	cd "$srcdir/package"
	npm install
}

package() {
	cd "$srcdir/package"
	npm install -g --user root --prefix "$pkgdir/usr"
}
