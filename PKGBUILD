# Maintainer: Duologic <jeroen@simplistic.be>

pkgname=zoom-firefox
pkgver=0.0.2
pkgrel=1
pkgdesc=".desktop file for running Zoom in Firefox"
arch=('x86_64')
license=('MIT')
depends=('firefox')
optdepends=('xdg-utils')
install=zoom-firefox.install
source=('ZoomFirefox.desktop'
        'zoom-firefox')
sha512sums=('fd32a73eb0096f8cb95cbf44e89bf132090000e1b4465c0096f06753ac26bc73652490971f0006f809aa689d64b8fb043e049fe9cc3ed06f63b28506c178e33b'
  '269f429df173c0217c3c390f19b07556f79439351f8a2f8939a9afb68b6aa49246be9fff0994dfd9e986148ee710d6371b6d3de2dd0873501ab748092568ad03')

package() {
    install -Dm755 zoom-firefox "$pkgdir"/usr/bin/zoom-firefox
    install -Dm644 ZoomFirefox.desktop "$pkgdir"/usr/share/applications/ZoomFirefox.desktop
}
