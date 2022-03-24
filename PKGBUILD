# Maintainer: Krishna <krishna404@yandex.com>
pkgname='fm6000'
pkgver=6000.1
pkgrel=1
pkgdesc="Simple Dilbert themed system info-fetching tool"
arch=('x86_64')
url="https://github.com/anhsirk0/fetch-master-6000"
license=('GPL')
groups=()
depends=('perl')
makedepends=('git')
provides=('fm6000')
conflicts=('fm6000-bin')
source=('fm6000::https://raw.githubusercontent.com/anhsirk0/fetch-master-6000/master/fm6000.pl')
md5sums=('SKIP')

package() {
	install -Dm755 ./fm6000 "$pkgdir/usr/bin/fm6000"
}
