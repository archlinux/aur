# Maintainer: Pierre Le Gall

pkgname=sheld-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Sandbox any shell command via YAML profiles using Bubblewrap"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/pierrelegall/sheld"
license=('GPL-3.0-only')
depends=('bubblewrap')
provides=('sheld')
conflicts=('sheld')

source_x86_64=("sheld-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/sheld-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("sheld-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/sheld-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_i686=("sheld-v${pkgver}-i686-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/sheld-v${pkgver}-i686-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('79dae1382c340c2c6b6a653bf45dc4dc3ad923fb10172d0a78d13b1ac1ed113b')
sha256sums_aarch64=('e347afe1f6e4e19df4067b4132b041f9153b3cbf594aed4feb264f5dd4982537')
sha256sums_i686=('619a29496fc3648dbebe2a9e4e312706365327b7fcbc9fa32456b8af35657d89')

package() {
    install -Dm755 sheld "$pkgdir/usr/bin/sheld"
}
