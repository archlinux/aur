# Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=distribyted-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="Torrent client with on-demand file downloading as a filesystem"
arch=('x86_64')
url="https://github.com/distribyted/distribyted"
license=('GPL3')
depends=('gcc-libs')
provides=('distribyted')
conflicts=('distribyted')
source=("https://github.com/distribyted/distribyted/releases/download/v${pkgver}/distribyted-v${pkgver}-linux-amd64")
sha256sums=('fe9aa300c0c55e7fe52d6d355d6f58a17a7436de3e428cdbd5891b3d9f7e1dcd')

package() {
    install -D -m 755 "distribyted-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/distribyted"
}
