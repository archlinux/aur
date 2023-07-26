pkgname=transifex-client-go
pkgver=1.6.9
pkgrel=1.0
pkgdesc='transifex client go version'
arch=('x86_64')
url='https://github.com/transifex/cli'
license=('apache-2.0')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/transifex/cli/releases/download/v${pkgver}/tx-linux-amd64.tar.gz")
sha256sums=('6574dfb9c34952054fd6fb4d446097213e262d47ef4a73f181caa4d1478d7ecb')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "tx"
}
