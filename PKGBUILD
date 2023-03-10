pkgname=transifex-client-go
pkgver=1.6.5
pkgrel=1.0
pkgdesc='transifex client go version'
arch=('x86_64')
url='https://github.com/transifex/cli'
license=('apache-2.0')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/transifex/cli/releases/download/v${pkgver}/tx-linux-amd64.tar.gz")
sha256sums=('040c6f4c15c6ef609c532db60763133ad5bda113d00eae71bad11d31c80fedb7')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "tx"
}
