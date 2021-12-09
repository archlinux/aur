# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=charm-tool-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="The Charm Cloud Tool"
arch=('x86_64')
url="https://github.com/charmbracelet/charm"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-tool-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('0a7246b6b92fba145e712d4f5e05c03bc4911698875b99cb8e737894b616fc16')

package() {
    install -Dm755 "${pkgname%-tool-bin}" "$pkgdir/usr/bin/${pkgname%-tool-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
