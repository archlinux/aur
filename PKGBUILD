# Maintainer: Duologic <jeroen@simplistic.be>

pkgname=zoom-firefox
pkgver=0.0.3
pkgrel=0
pkgdesc=".desktop file for running Zoom in Firefox"
arch=('x86_64')
license=('MIT')
depends=('firefox')
optdepends=('xdg-utils')
install=zoom-firefox.install
source=('ZoomFirefox.desktop'
        'zoom-firefox')
sha512sums=('fd32a73eb0096f8cb95cbf44e89bf132090000e1b4465c0096f06753ac26bc73652490971f0006f809aa689d64b8fb043e049fe9cc3ed06f63b28506c178e33b'
            'eee9b5c6c6c0bce321b332e4562d559c8da47d13f69a3ba86c962663c58067b673b4238129907102bc461f491ed73b5e5a6588c1c99ce5a78dbf361d0f0dac59')

package() {
    install -Dm755 zoom-firefox "$pkgdir"/usr/bin/zoom-firefox
    install -Dm644 ZoomFirefox.desktop "$pkgdir"/usr/share/applications/ZoomFirefox.desktop
}
