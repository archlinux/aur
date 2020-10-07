# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=charm-tool-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="The Charm Cloud Tool"
arch=('x86_64')
url="https://github.com/charmbracelet/charm"
license=('MIT')
options=('!strip')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-tool-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('cd03beb5f1296e21cd1a9456307ead54dab68de587925d052c10ede5ef6f4251')

package() {
    install -Dm755 "${pkgname%-tool-bin}" "$pkgdir/usr/bin/${pkgname%-tool-bin}"
    #install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
