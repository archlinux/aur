pkgname=transifex-client-bin
pkgver=1.6.12
pkgrel=1
pkgdesc='transifex client go version'
arch=('x86_64')
url='https://github.com/transifex/cli'
license=('apache-2.0')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/transifex/cli/releases/download/v${pkgver}/tx-linux-amd64.tar.gz")
sha256sums=('f921899f1634b4f037b7f0794de01b75c0b9b9f743f00677a0e2853d11ef00a8')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "tx"
}
