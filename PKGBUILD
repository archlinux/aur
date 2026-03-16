# Maintainer: mogglemoss <scott.corbin@gmail.com>
pkgname=lazytailscale-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal dashboard for your Tailscale network"
arch=('x86_64' 'aarch64')
url="https://github.com/mogglemoss/lazytailscale"
license=('MIT')
provides=('lazytailscale')
conflicts=('lazytailscale')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/mogglemoss/lazytailscale/releases/download/v${pkgver}/lazytailscale_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/mogglemoss/lazytailscale/releases/download/v${pkgver}/lazytailscale_linux_arm64.tar.gz")

sha256sums_x86_64=('d35b3bc3ebf340b471aa55110766b3bbbe0d1ef800ffa78a863442823791a966')
sha256sums_aarch64=('a82211e65ed19b4c387c5dc6966416a187d7ead40aec09473a445ed0b22162d0')

package() {
    install -Dm755 lazytailscale "${pkgdir}/usr/bin/lazytailscale"
}
