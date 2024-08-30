# Maintainer: axzxc1236 <axzxc1236 [(@>>] users.noreply.github.com>
pkgname=twitch-dl-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'ffmpeg')
provides=('twitch-dl' 'twitch-dl-bin')
conflicts=('twitch-dl' 'twitch-dl-bin')
source=('https://github.com/ihabunek/twitch-dl/releases/download/2.5.0/twitch-dl.2.5.0.pyz')
sha256sums=('fd9825e531fffa4eb45d921de2a1f67f36e8c2114512d22ca905832bcf87e605')
noextract=('twitch-dl')

package() {
    install -Dm644 "${srcdir}/twitch-dl.${pkgver}.pyz" "${pkgdir}/usr/bin/twitch-dl"
    chmod +x ${pkgdir}/usr/bin/twitch-dl
}
