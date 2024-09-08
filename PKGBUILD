# Maintainer: axzxc1236 <axzxc1236 [(@>>] users.noreply.github.com>
pkgname=twitch-dl-bin
pkgver=2.8.2
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'ffmpeg')
provides=('twitch-dl' 'twitch-dl-bin')
conflicts=('twitch-dl' 'twitch-dl-bin')
source=('https://github.com/ihabunek/twitch-dl/releases/download/2.8.2/twitch-dl.2.8.2.pyz')
sha256sums=('ad260280dc6e91d39cb6ef40b19886ec4b35efc5faba6c2a35991cd4e0ed3c4b')
noextract=('twitch-dl')

package() {
    install -Dm644 "${srcdir}/twitch-dl.${pkgver}.pyz" "${pkgdir}/usr/bin/twitch-dl"
    chmod +x ${pkgdir}/usr/bin/twitch-dl
}
