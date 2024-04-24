# Maintainer: axzxc1236 <axzxc1236 [(@>>] users.noreply.github.com>
pkgname=twitch-dl-bin
pkgver=2.2.3
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'ffmpeg')
provides=('twitch-dl' 'twitch-dl-bin')
conflicts=('twitch-dl' 'twitch-dl-bin')
source=('https://github.com/ihabunek/twitch-dl/releases/download/2.2.3/twitch-dl.2.2.3.pyz')
sha256sums=('c896f55c0ae73ac6afcb980c4b57555e2a0c9fcfead24236d1a1203f0f74c50c')
noextract=('twitch-dl')

package() {
    install -Dm644 "${srcdir}/twitch-dl.${pkgver}.pyz" "${pkgdir}/usr/bin/twitch-dl"
    chmod +x ${pkgdir}/usr/bin/twitch-dl
}
