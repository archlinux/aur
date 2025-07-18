# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=('x86_64')
url="https://github.com/stabldev/torrra"
license=('MIT')
depends=()
provides=('torrra')
conflicts=('torrra')
source=("https://github.com/stabldev/torrra/releases/download/v${pkgver}/torrra-v${pkgver}-linux-x86_64")
sha256sums=('de9104c6cfbcb64ed42c541ece46ef1fa90dc7b61e5d1799b9df5babc66ab8d1')

package() {
    install -Dm755 "torrra-v${pkgver}-linux-x86_64" "$pkgdir/usr/bin/torrra"
}
