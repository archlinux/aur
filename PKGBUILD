# Maintainer: axzxc1236 <axzxc1236 [(@>>] users.noreply.github.com>
pkgname=twitch-dl-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'ffmpeg')
provides=('twitch-dl' 'twitch-dl-bin')
conflicts=('twitch-dl' 'twitch-dl-bin')
source=('https://github.com/ihabunek/twitch-dl/releases/download/2.1.2/twitch-dl.2.1.2.pyz')
sha256sums=('8ab1a4cb0be8bcb613fd6e078f327456a495bd5e31be2d372c3683fb382fbc73')
noextract=('twitch-dl')

package() {
    install -Dm644 "${srcdir}/twitch-dl.${pkgver}.pyz" "${pkgdir}/usr/bin/twitch-dl"
    chmod +x ${pkgdir}/usr/bin/twitch-dl
}
