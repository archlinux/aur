# Maintainer: Haris Gušić <harisgusic dot dev at gmail dot com>
pkgname=svg-term-cli
pkgdesc="Share terminal sessions via SVG and CSS"
pkgver=2.1.1
pkgrel=1
arch=('x86_64')
url="https://github.com/marionebl/svg-term-cli"
license=('MIT')
depends=('nodejs' 'asciinema')
makedepends=('npm')

package() {
	npm install -g --prefix "$pkgdir/usr" "$pkgname@$pkgver"
}
