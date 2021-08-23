# Maintainer: Jared Meeker <jared at meekers dot org>

pkgname=dnote-cli-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="A simple command line notebook for programmers"
arch=('x86_64')
url="https://www.getdnote.com/"
license=('GPL3')
provides=('dnote-cli')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dnote/dnote/releases/download/cli-v${pkgver}/dnote_${pkgver}_linux_amd64.tar.gz")
sha256sums=('cf769acd15d4a6885181e8bde298487b7c76eddb6afc0fea88fb1642de4c4401')

package() {
  install -Dm755 "$srcdir/dnote" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
