# Collaborator: Liqueur Librazy <im@librazy.org>
# Maintainer: Jian Zeng <anonymousknight96@gmail.com>
pkgname=tidb-bin
pkgver=1.0.0
pkgrel=1

pkgdesc="A distributed NewSQL database compatible with MySQL protocol"
arch=('x86_64')
url="https://github.com/pingcap/tidb"
license=('APACHE')
depends=('gcc-libs')
conflict=('tidb-bin-nightly')
options=()
source=("https://download.pingcap.org/tidb-latest-linux-amd64.tar.gz")

sha256sums=('f09a794104b546fc9a6de5dd323c23f5871e98edcb1dcd7a909c518dc2f19835')

package() {
	install -dm755 "$pkgdir"/usr/bin
	cd "tidb-latest-linux-amd64/bin"
	install -D -m755 ti* pd-* "${pkgdir}/usr/bin"
}
