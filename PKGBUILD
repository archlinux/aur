pkgname=transifex-client-bin
pkgver=1.6.10
pkgrel=2
pkgdesc='transifex client go version'
arch=('x86_64')
url='https://github.com/transifex/cli'
license=('apache-2.0')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/transifex/cli/releases/download/v${pkgver}/tx-linux-amd64.tar.gz")
sha256sums=('dcc747ae863dd5a232b6a322f78b8621f43cd6032189ee89e979418cc24927f2')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "tx"
}
