# Maintainer: Duologic <jeroen@simplistic.be>

pkgname=zoom-firefox
pkgver=0.0.2
pkgrel=3
pkgdesc=".desktop file for running Zoom in Firefox"
arch=('x86_64')
license=('MIT')
depends=('firefox')
optdepends=('xdg-utils')
install=zoom-firefox.install
source=('ZoomFirefox.desktop'
        'zoom-firefox')
sha512sums=('fd32a73eb0096f8cb95cbf44e89bf132090000e1b4465c0096f06753ac26bc73652490971f0006f809aa689d64b8fb043e049fe9cc3ed06f63b28506c178e33b'
            '46dc798fd3f3a4cd7413df4da909742a674a7d080ec03fd2c8d87a102fbf5bb70792160629049d1f69a59bad05b7fa5561fd06681da3be8789d50ee54c456687')

package() {
    install -Dm755 zoom-firefox "$pkgdir"/usr/bin/zoom-firefox
    install -Dm644 ZoomFirefox.desktop "$pkgdir"/usr/share/applications/ZoomFirefox.desktop
}
