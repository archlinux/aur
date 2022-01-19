# Maintainer: axzxc1236 <axzxc1236 [(@>>] users.noreply.github.com>
pkgname=twitch-dl-bin
pkgver=1.17.1
pkgrel=2
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'ffmpeg')
provides=('twitch-dl' 'twitch-dl-bin')
conflicts=('twitch-dl' 'twitch-dl-bin')
source=('twitch-dl::https://github.com/ihabunek/twitch-dl/releases/download/1.17.1/twitch-dl.1.17.1.pyz')
sha256sums=('402efcc6123a14f89aa394e9f504d55d2c24f28d04e6aeb4df7e1a9aac0ff548')
noextract=('twitch-dl')

package() {
    install -Dm644 "${srcdir}/twitch-dl" "${pkgdir}/usr/bin/twitch-dl"
    chmod +x ${pkgdir}/usr/bin/twitch-dl
}
