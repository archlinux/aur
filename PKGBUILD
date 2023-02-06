# Maintainer: Berke Enercan <berkeenercan@tutanota.com>

pkgname=ytsub-bin
_pkgname=ytsub
pkgver=0.4.0
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
sha256sums=('1a3b78ead7d4026f49d56a763e425bb5689f570a4be030b838170a75ddd59709')

package() {
    install -Dm755 "$_pkgname" "${pkgdir}/usr/bin/${_pkgname}"
}
