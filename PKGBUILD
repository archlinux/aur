# Maintainer: Berke Enercan <berkeenercan@tutanota.com>

pkgname=ytsub-bin
_pkgname=ytsub
pkgver=0.5.0
pkgrel=2
pkgdesc='A subscriptions only TUI Youtube client'
url='https://github.com/sarowish/ytsub'
arch=("x86_64")
license=('GPL-3.0-only')
depends=('gcc-libs')
optdepends=('mpv: for playing videos', 'yt-dlp: for playing videos')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('ed9eea0cbf57eb73be3161e0bc90937bac5ced3d1f3252ccd61da475369bf44b')

package() {
    install -Dm755 "$_pkgname" "${pkgdir}/usr/bin/${_pkgname}"
}
