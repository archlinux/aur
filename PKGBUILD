# Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=distribyted-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Torrent client with on-demand file downloading as a filesystem"
arch=('x86_64')
url="https://github.com/distribyted/distribyted"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
provides=('distribyted')
conflicts=('distribyted')
source=("https://github.com/distribyted/distribyted/releases/download/v${pkgver}/distribyted-v${pkgver}-linux-amd64")
sha256sums=('36d04c0e63b70546b8b69604697df1782b3cfacaba0de91300cd748003b24012')

package() {
    install -D -m 755 "distribyted-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/distribyted"
}
