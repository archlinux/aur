# Maintainer: Berke Enercan <berkeenercan@tutanota.com>

pkgname=ytsub-bin
_pkgname=ytsub
pkgver=0.5.0
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
sha256sums=('b0574dadf864e29dd638aedc017b2560a801c43b6e6a6476dc71903e9828d0ad')

package() {
    install -Dm755 "$_pkgname" "${pkgdir}/usr/bin/${_pkgname}"
}
