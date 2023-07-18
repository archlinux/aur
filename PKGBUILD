pkgname=transifex-client-go
pkgver=1.6.8
pkgrel=1.0
pkgdesc='transifex client go version'
arch=('x86_64')
url='https://github.com/transifex/cli'
license=('apache-2.0')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/transifex/cli/releases/download/v${pkgver}/tx-linux-amd64.tar.gz")
sha256sums=('07dd5214d365227650c5a71eacd99e5cc24ba406c6f03b84e623bc99b1afb274')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "tx"
}
