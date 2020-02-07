# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=assetfinder
pkgver=0.1.0
pkgrel=1
pkgdesc="Find domains and subdomains related to a given domain"
arch=('i686' 'x86_64')
url="https://github.com/tomnomnom/assetfinder"
license=('MIT')

source_i686=(https://github.com/tomnomnom/assetfinder/releases/download/v${pkgver}/assetfinder-linux-386-${pkgver}.tgz)
source_x86_64=(https://github.com/tomnomnom/assetfinder/releases/download/v${pkgver}/assetfinder-linux-amd64-${pkgver}.tgz)

sha256sums_i686=('18177c0b323a2c5ff71337b5d22d1b1ed05ded05c1c9df9d1b992aef2bf68a90')
sha256sums_x86_64=('9609bf91d8b4892cc88908747f17f5e5fe50525f00a814d41e6cd0efe1c2e545')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/assetfinder-linux-*-${pkgver}.tgz"
    install "${pkgdir}/assetfinder" "${pkgdir}/usr/bin/assetfinder"
}

