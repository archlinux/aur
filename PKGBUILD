# Maintainer: flying sheep <flying-sheep@web.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=nodejs-jsdoc
pkgver=3.4.0
pkgrel=1
pkgdesc="An API documentation generator for JavaScript"
url="https://github.com/jsdoc3/jsdoc"
arch=('any')
license=('APACHE')
depends=('nodejs')
makedepends=('npm')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" jsdoc@$pkgver
}
