# Maintainer: fsyy <fossy2001 at web dot de>

pkgname=archive-cli
pkgver=0.4
pkgrel=1
pkgdesc="Extract/Compress easy to learn function. The script takes care of the file extension to call the good command."
url="https://github.com/azlux/archive-cli"
license=('unknown')
arch=('any')
source=("https://github.com/azlux/archive-cli/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('318e7ca3a14c940647c5642508482811a947d87b97a0a33dd93f3db04a16d88aaf4c43e1bc62d9c77b0ccf97ce086c2e8e8d7fe587717fa27cd1d6235eee10bf')
depends=('sh')
optdepends=('p7zip: 7-zip support')

package() {
	cd "$pkgname-$pkgver"
        install -D -m777 archive-create "${pkgdir}/usr/bin/archive-create"
        install -D -m777 archive-extract "${pkgdir}/usr/bin/archive-extract"
}
