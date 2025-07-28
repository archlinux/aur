# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=('x86_64')
url="https://github.com/stabldev/torrra"
license=('MIT')
depends=()
provides=('torrra')
conflicts=('torrra')
source=("https://github.com/stabldev/torrra/releases/download/v${pkgver}/torrra_${pkgver}_linux_x86_64")
sha256sums=('aa56eda43d08270ddf991aa3bbdb61aa3b1096aca6d1ad196b1a8075598aca24')

package() {
    install -Dm755 "torrra_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/torrra"
}
