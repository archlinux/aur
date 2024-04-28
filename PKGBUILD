# Maintainer: Lesnikov Vladimir <v.a.lesnikov@vk.com>
pkgname='pft'
pkgver='0.5.0'
pkgrel=1
pkgdesc='TCP file sender/receiver'
arch=('x86_64' 'i686' 'pentium4' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/faceleft/pft'

license=('MIT')
makedepends=('go')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('SKIP')


build() {
	cd "$pkgname-$pkgver"
    go build
}

package() {
	cd "$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/bin
    cp pft $pkgdir/usr/bin
}
