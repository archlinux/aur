# Maintainer: Anderew Steinke <rkcf@rkcf.me>
# Contributor: Adrian Sinclair <adrian@transloadit.com>

pkgname=eslint-plugin-promise
pkgver=4.0.1
pkgrel=1
pkgdesc='Enforce best practices for JavaScript promises'
arch=('any')
url='https://github.com/xjamundx/eslint-plugin-promise'
license=('ISC')
depends=('nodejs' 'eslint')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
md5sums=('ba79ae6fd2334c3ff241a6fad9b82320')

package() {
	npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
