# Maintainer: Mus <sonics0977703996@gmail.com>
pkgname=mrain-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Rain - Simple TUI player"
arch=('x86_64')
url="https://github.com/musdev13/rain"
license=('GPL3')
depends=('mpv' 'curl' 'taglib')
optdepends=('yt-dlp: for YouTube Music and Spotify support')
source=("${pkgname}-${pkgver}::https://github.com/musdev13/rain/releases/download/v${pkgver}/rain")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/rain"
}
