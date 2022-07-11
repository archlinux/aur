# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=mic-mute-led-reverse
pkgver=1
pkgrel=1
pkgdesc='Reverse microphone mute led'
arch=('any')
source=('mic-mute-led-reverse.service')
sha1sums=('6a7c47f32370aad3daaec8fda0451b3f7cd74a28')
install='mic-mute-led-reverse.install'

package() {
    install -D -m 644 "${srcdir}/mic-mute-led-reverse.service" "${pkgdir}/etc/systemd/system/mic-mute-led-reverse.service"
}
