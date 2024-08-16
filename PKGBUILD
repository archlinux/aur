pkgname=transifex-client-bin
pkgver=1.6.16
pkgrel=1
pkgdesc='transifex client go version'
arch=('x86_64')
url='https://github.com/transifex/cli'
license=('apache-2.0')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/transifex/cli/releases/download/v${pkgver}/tx-linux-amd64.tar.gz")
sha256sums=('29f5a59b3820adf140f584e9e3aad1fc55a7ed06540a5131eff91259e2db8431')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "tx"
}
