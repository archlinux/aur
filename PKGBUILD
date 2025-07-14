# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=('x86_64')
url="https://github.com/stabldev/torrra"
license=('MIT')
depends=()
provides=('torrra')
conflicts=('torrra')
source=("https://github.com/stabldev/torrra/releases/download/v${pkgver}/torrra-v${pkgver}-linux-x86_64")
sha256sums=('2fa4d782105a5288a54094ffbbe6fc7fd137cfac3e0655169e1f3eb67a9ba44e')

package() {
    install -Dm755 "torrra-v${pkgver}-linux-x86_64" "$pkgdir/usr/bin/torrra"
}
