# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

pkgname=zoom-firefox
pkgver=0.0.1
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
            'e8ba856ccec6cd9d730ef8b5a43aa82c1e0189c50cdfc02d823d0e913024243c9d59c9bd313edd039d3ba8e1c8ba08ff97d69c1bfd1e4f4997edc8b535206be7')

package() {
    install -Dm755 zoom-firefox "$pkgdir"/usr/bin/zoom-firefox
    install -Dm644 ZoomFirefox.desktop "$pkgdir"/usr/share/applications/ZoomFirefox.desktop
}
