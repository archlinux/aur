pkgname=transifex-client-bin
pkgver=1.6.17
pkgrel=1
pkgdesc='transifex client go version'
arch=('x86_64')
url='https://github.com/transifex/cli'
license=('apache-2.0')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/transifex/cli/releases/download/v${pkgver}/tx-linux-amd64.tar.gz")
sha256sums=('002dec5b9e71248a7e6a0808118e9da940205828d5a33ce88e04bb57a967164d')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "tx"
}
