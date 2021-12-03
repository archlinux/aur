# Maintainer: axzxc1236 <axzxc1236 [(@>>] users.noreply.github.com>
pkgname=twitch-dl-bin
pkgver=1.17.0
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'ffmpeg')
provides=('twitch-dl' 'twitch-dl-bin')
conflicts=('twitch-dl' 'twitch-dl-bin')
source=('twitch-dl::https://github.com/ihabunek/twitch-dl/releases/download/1.17.0/twitch-dl.1.17.0.pyz')
sha256sums=('4fb00f59059a2a4d4a5d4cee17f94a4ed998228dd8edfb1c24c76de9897a23ee')
noextract=('twitch-dl')

package() {
    install -Dm644 "${srcdir}/twitch-dl" "${pkgdir}/usr/bin/twitch-dl"
    chmod +x ${pkgdir}/usr/bin/twitch-dl
}