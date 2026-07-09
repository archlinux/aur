# Maintainer: codeztech <alex@dinofudge.co.uk>
pkgname=awiki
pkgver=1.0.0
pkgrel=1
pkgdesc="A python-only CLI tool to search and read the Arch Wiki directly in your terminal"
arch=('any')
url="https://github.com/SmoothCdoer9981/awiki"
license=('MIT')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SmoothCdoer9981/awiki/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ae3c5c8bc00cdc730bae73c9e69139436f3d6c95d760749410f9f0bda5a703b3')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/awiki" "${pkgdir}/usr/bin/awiki"
}
