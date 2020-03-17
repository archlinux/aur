# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fortio-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='Fortio load testing library, command line tool, advanced echo server and web UI in go (golang). Allows to specify a set query-per-second load and record latency histograms and other useful stats'
arch=('x86_64')
url="https://fortio.org"
license=('Apache2')
makedepends=('tar')
provides=('fortio')
noextract=("${pkgname}-${pkgver}")
source=("${pkgname}-${pkgver}::https://github.com/fortio/fortio/releases/download/v${pkgver}/fortio-linux_x64-${pkgver}.tgz")
md5sums=('9b9c93009f5a87174826031476db4887')

package() {
	cd "${srcdir}"
	tar xf $pkgname-$pkgver -C $pkgdir/
}
# vim:set ts=2 sw=2 et: