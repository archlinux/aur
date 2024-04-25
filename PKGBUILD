pkgname=transifex-client-bin
pkgver=1.6.11
pkgrel=1
pkgdesc='transifex client go version'
arch=('x86_64')
url='https://github.com/transifex/cli'
license=('apache-2.0')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/transifex/cli/releases/download/v${pkgver}/tx-linux-amd64.tar.gz")
sha256sums=('f9e3eeb5b7834a3ed84f2742a85afc7f12f99eb37aa5359db46af1623f6747fd')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "tx"
}
