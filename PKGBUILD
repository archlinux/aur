# Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=distribyted-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Torrent client with on-demand file downloading as a filesystem"
arch=('x86_64')
url="https://github.com/distribyted/distribyted"
license=('GPL3')
depends=('gcc-libs')
provides=('distribyted')
conflicts=('distribyted')
source=("https://github.com/distribyted/distribyted/releases/download/v${pkgver}/distribyted-v${pkgver}-linux-amd64")
sha256sums=('a8059d0b6423888967fcb2c4409962947df3060d387a098210efb9daf457f668')

package() {
    install -D -m 755 "distribyted-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/distribyted"
}
