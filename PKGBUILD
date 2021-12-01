# Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=distribyted-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Torrent client with on-demand file downloading as a filesystem"
arch=('x86_64')
url="https://github.com/distribyted/distribyted"
license=('GPL3')
depends=('gcc-libs')
provides=('distribyted')
conflicts=('distribyted')
source=("https://github.com/distribyted/distribyted/releases/download/v${pkgver}/distribyted-v${pkgver}-linux-amd64")
sha256sums=('3c3526bb1dd0eb0baa3fc5c54cbf77237e142cb623cf47f713e2cb3ed09dcf06')

package() {
    install -D -m 755 "distribyted-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/distribyted"
}
