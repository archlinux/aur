# Maintainer: Berke Enercan <berkeenercan@tutanota.com>

pkgname=ytsub-bin
_pkgname=ytsub
pkgver=0.6.0
pkgrel=1
pkgdesc='A subscriptions only TUI Youtube client'
url='https://github.com/sarowish/ytsub'
arch=("x86_64")
license=('GPL-3.0-only')
depends=('gcc-libs')
optdepends=('mpv: for playing videos', 'yt-dlp: for playing videos')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('fc872fbeb5c6cc43e8abf9fd0099820ab4a6b27f3536e23442cc77cd652e1343')

package() {
    install -Dm755 "$_pkgname" "${pkgdir}/usr/bin/${_pkgname}"
}
