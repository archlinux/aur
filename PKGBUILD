# Maintainer: mogglemoss <scott.corbin@gmail.com>
pkgname=lazytailscale-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="A terminal dashboard for your Tailscale network"
arch=('x86_64' 'aarch64')
url="https://github.com/mogglemoss/lazytailscale"
license=('MIT')
provides=('lazytailscale')
conflicts=('lazytailscale')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/mogglemoss/lazytailscale/releases/download/v${pkgver}/lazytailscale_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/mogglemoss/lazytailscale/releases/download/v${pkgver}/lazytailscale_linux_arm64.tar.gz")

sha256sums_x86_64=('86e66aa87b2c1b077f4cf839d0cd30e59674ff151bb9bc261b71d3e3fcddb062')
sha256sums_aarch64=('33e9d063c2e0e9c74ca302672e8df237b9aab7902ba1dd9a48678bd9befa07f1')

package() {
    install -Dm755 lazytailscale "${pkgdir}/usr/bin/lazytailscale"
}
