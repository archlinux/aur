# Maintainer: mogglemoss <scott.corbin@gmail.com>
pkgname=lazytailscale-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A terminal dashboard for your Tailscale network"
arch=('x86_64' 'aarch64')
url="https://github.com/mogglemoss/lazytailscale"
license=('MIT')
provides=('lazytailscale')
conflicts=('lazytailscale')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/mogglemoss/lazytailscale/releases/download/v${pkgver}/lazytailscale_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/mogglemoss/lazytailscale/releases/download/v${pkgver}/lazytailscale_linux_arm64.tar.gz")

sha256sums_x86_64=('4696fb89afd9e728e6087855e2d9307dc654c8a811007516f1ee9919c7300130')
sha256sums_aarch64=('7a4a41d455b6ac5f9e5b54f7e2658b188dd9ffd7e6c2a5a5c065902910d2aded')

package() {
    install -Dm755 lazytailscale "${pkgdir}/usr/bin/lazytailscale"
}
