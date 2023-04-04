pkgname=transifex-client-go
pkgver=1.6.7
pkgrel=1.0
pkgdesc='transifex client go version'
arch=('x86_64')
url='https://github.com/transifex/cli'
license=('apache-2.0')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/transifex/cli/releases/download/v${pkgver}/tx-linux-amd64.tar.gz")
sha256sums=('8b328e8cccf8f9fe6dfbf7069c94d6408edb8657e7485386674349fd5a8b4cc5')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "tx"
}
