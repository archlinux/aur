# Maintainer: axzxc1236 <axzxc1236 [(@>>] users.noreply.github.com>
pkgname=twitch-dl-bin
pkgver=2.2.2
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'ffmpeg')
provides=('twitch-dl' 'twitch-dl-bin')
conflicts=('twitch-dl' 'twitch-dl-bin')
source=('https://github.com/ihabunek/twitch-dl/releases/download/2.2.2/twitch-dl.2.2.2.pyz')
sha256sums=('7f615238ddb9c7337ff6e37e42a05fdff7b74ffc8ae0eb6167d3a9f64856be15')
noextract=('twitch-dl')

package() {
    install -Dm644 "${srcdir}/twitch-dl.${pkgver}.pyz" "${pkgdir}/usr/bin/twitch-dl"
    chmod +x ${pkgdir}/usr/bin/twitch-dl
}
