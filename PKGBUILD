pkgname=transifex-client-bin
pkgver=1.6.14
pkgrel=1
pkgdesc='transifex client go version'
arch=('x86_64')
url='https://github.com/transifex/cli'
license=('apache-2.0')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/transifex/cli/releases/download/v${pkgver}/tx-linux-amd64.tar.gz")
sha256sums=('a85d6889f1a90b8f683aa566c56abecceb6e66a2d76604cfc19ff8d26508b1d6')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "tx"
}
