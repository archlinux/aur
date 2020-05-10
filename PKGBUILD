# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dnote-server-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple command line notebook for programmers (Server)"
arch=('x86_64')
url="https://www.getdnote.com/"
license=('AGPL3')
provides=('dnote-server')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dnote/dnote/releases/download/server-v${pkgver}/dnote_server_${pkgver}_linux_amd64.tar.gz")
sha256sums=('fd3b77f7ed70430ee675019fd5c3a0b0ca4b8f6757a256f5fedca7a7959db3da')

package() {
  install -Dm755 "$srcdir/dnote-server" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/"
}