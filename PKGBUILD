pkgname=transifex-client-go
pkgver=1.6.6
pkgrel=1.0
pkgdesc='transifex client go version'
arch=('x86_64')
url='https://github.com/transifex/cli'
license=('apache-2.0')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/transifex/cli/releases/download/v${pkgver}/tx-linux-amd64.tar.gz")
sha256sums=('c3532f66751b012e12417bdad1d50079c104a67b3fb80147c929958888bce019')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "tx"
}
