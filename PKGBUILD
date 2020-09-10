# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dnote-server-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="A simple command line notebook for programmers (Server)"
arch=('x86_64')
url="https://www.getdnote.com/"
license=('AGPL3')
provides=('dnote-server')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dnote/dnote/releases/download/server-v${pkgver}/dnote_server_${pkgver}_linux_amd64.tar.gz")
sha256sums=('0c35a5d1affa45a5406f816344375c1541f7b602d0be8e765af6a2db21a8ecbc')

package() {
  install -Dm755 "$srcdir/dnote-server" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/"
}