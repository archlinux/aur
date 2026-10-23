pkgname=opentunnel-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='Public URLs for local services, end-to-end encrypted'
url='https://opentunnel.xyz'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opentunnel')
conflicts=('opentunnel')
options=('!debug' '!strip')
source_aarch64=("opentunnel-0.6.1-aarch64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.6.1/opentunnel-linux-arm64.tar.gz")
sha256sums_aarch64=('2d181137e4f5f02f11eae2c4f71e6dea943362ad8159a9ca759f714ab5544e73')
source_x86_64=("opentunnel-0.6.1-x86_64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.6.1/opentunnel-linux-x64.tar.gz")
sha256sums_x86_64=('862b64e7a7947b46ed9f66be3f6e2ae4324c60d6cf53ec504a2614552669e8f9')

package() {
  install -Dm755 opentunnel "$pkgdir/usr/bin/opentunnel"
}
