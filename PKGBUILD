# Maintainer: Your Name <niumination.github.io>
pkgname=niu-speedtest
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple CLI speedtest tool for Arch Linux"
arch=('any')
url="https://github.com/niumination/niu-speedtest"
license=('MIT')
depends=('python>=3.6')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/niumination/niu-speedtest/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${pkgname}-${pkgver}"
    
    # Install the main script
    install -Dm755 speedtest.py "${pkgdir}/usr/bin/niu-speedtest"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
