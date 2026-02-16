# Maintainer: AVR-ochkarik <electroon21@gmail.com>
pkgname=ncmpcpp-album-cover-git
pkgver=1.0
pkgrel=1
pkgdesc="Simple script for displaying ncmpcpp album covers in a separate terminal using mpv"
arch=('any')
url="https://github.com/AVR-ochkarik/ncmpcpp-album-cover"
license=('MIT')
depends=('mpd' 'mpc' 'mpv' 'socat')
source=("git+https://github.com/AVR-ochkarik/ncmpcpp-album-cover")
md5sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/${pkgname%-git}/ncmpcpp-album-cover.sh" "${pkgdir}/usr/bin/ncmpcpp-cover"
}
