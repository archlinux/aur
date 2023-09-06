# Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=distribyted-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Torrent client with on-demand file downloading as a filesystem"
arch=('x86_64')
url="https://github.com/distribyted/distribyted"
license=('GPL3')
depends=('gcc-libs')
provides=('distribyted')
conflicts=('distribyted')
source=("https://github.com/distribyted/distribyted/releases/download/v${pkgver}/distribyted-v${pkgver}-linux-amd64")
sha256sums=('28600ce521d5d2f3c468cd79df079a12db98a6a0b02eb16ae773a2a5dcca024f')

package() {
    install -D -m 755 "distribyted-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/distribyted"
}
