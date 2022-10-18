# Maintainer: Berke Enercan <berkeenercan@tutanota.com>

pkgname=ytsub-bin
_pkgname=ytsub
pkgver=0.3.1
pkgrel=1
pkgdesc='A subscriptions only TUI Youtube client that uses the Invidious API'
url='https://github.com/sarowish/ytsub'
arch=("x86_64")
license=('GPL3')
depends=('gcc-libs')
optdepends=('mpv: for playing videos', 'yt-dlp: for playing videos')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('8e9cde1426fa1da77c4d1c881f8b13c8a1032deb64d0c98427d3703247418e46')

package() {
    install -Dm755 "$_pkgname" "${pkgdir}/usr/bin/${_pkgname}"
}
