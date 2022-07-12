# Maintainer: axzxc1236 <axzxc1236 [(@>>] users.noreply.github.com>
pkgname=twitch-dl-bin
pkgver=1.21.0
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'ffmpeg')
provides=('twitch-dl' 'twitch-dl-bin')
conflicts=('twitch-dl' 'twitch-dl-bin')
source=('twitch-dl::https://github.com/ihabunek/twitch-dl/releases/download/1.21.0/twitch-dl.1.21.0.pyz')
sha256sums=('5dc2b5090bcca154233d4acd3a755957900505495fc6ebdc54dd893ab3ae174a')
noextract=('twitch-dl')

package() {
    install -Dm644 "${srcdir}/twitch-dl" "${pkgdir}/usr/bin/twitch-dl"
    chmod +x ${pkgdir}/usr/bin/twitch-dl
}
