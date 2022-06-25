# Maintainer: axzxc1236 <axzxc1236 [(@>>] users.noreply.github.com>
pkgname=twitch-dl-bin
pkgver=1.22.0
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'ffmpeg')
provides=('twitch-dl' 'twitch-dl-bin')
conflicts=('twitch-dl' 'twitch-dl-bin')
source=('twitch-dl::https://github.com/ihabunek/twitch-dl/releases/download/1.22.0/twitch-dl.1.22.0.pyz')
sha256sums=('5755961d21c0a23fa149d0a5083fa0329742ef52ecd70de7072eabba5ae18c02')
noextract=('twitch-dl')

package() {
    install -Dm644 "${srcdir}/twitch-dl" "${pkgdir}/usr/bin/twitch-dl"
    chmod +x ${pkgdir}/usr/bin/twitch-dl
}
