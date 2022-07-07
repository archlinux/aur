# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Federico Barcelona <tembleking at gmail dot com>

pkgname=alva
pkgver=0.9.1
pkgrel=2
pkgdesc="Create living prototypes with code components"
arch=("any")
url='https://github.com/meetalva/alva'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.deb")
sha256sums=('6ce247e33b17cae69f475776773abe4ea139dcc27633814dbfd166b15b135223')

package() {
	tar xf data.tar.xz -C "$pkgdir"
}
