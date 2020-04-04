# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dnote-server-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple command line notebook for programmers (Server)"
arch=('x86_64')
url="https://www.getdnote.com/"
license=('AGPL-3.0')
provides=('dnote-server')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dnote/dnote/releases/download/server-v${pkgver}/dnote_server_${pkgver}_linux_amd64.tar.gz")
md5sums=('753796dc2caea38db16eb4c302dcd54e')

package() {
	install -Dm755 "$srcdir/dnote-server" -t "${pkgdir}/usr/bin/"
	install -Dm644 "$srcdir/AGPLv3.txt" "$pkgdir/usr/share/licenses/dnote-server/LICENSE"
}