# Maintainer: axzxc1236 <axzxc1236 [(@>>] users.noreply.github.com>
pkgname=twitch-dl-bin
pkgver=1.13.1
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python')
provides=('twitch-dl' 'twitch-dl-bin')
conflicts=('twitch-dl' 'twitch-dl-bin')
source=('twitch-dl::https://github.com/ihabunek/twitch-dl/releases/download/1.13.1/twitch-dl.1.13.1.pyz')
sha256sums=('393ca46bcd2cca83d25ad33399204b3a1ecebc339c72cad80f6f1adb51976f4e')
noextract=('twitch-dl')

package() {
    install -Dm644 "${srcdir}/twitch-dl" "${pkgdir}/usr/bin/twitch-dl"
	chmod +x ${pkgdir}/usr/bin/twitch-dl
}