pkgname=opentunnel-bin
pkgver=0.5.3
pkgrel=1
pkgdesc='Public URLs for local services, end-to-end encrypted'
url='https://opentunnel.xyz'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opentunnel')
conflicts=('opentunnel')
options=('!debug' '!strip')
source_aarch64=("opentunnel-0.5.3-aarch64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.5.3/opentunnel-linux-arm64.tar.gz")
sha256sums_aarch64=('92a56ad695be01e0ebe7de59a7de6db0a4bf5b29fdf9662555e4bec41588ba21')
source_x86_64=("opentunnel-0.5.3-x86_64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.5.3/opentunnel-linux-x64.tar.gz")
sha256sums_x86_64=('1da684ed261f946a757d3016806eff585243cc40c0cbf59cb7e893976c1d2dd3')

package() {
  install -Dm755 opentunnel "$pkgdir/usr/bin/opentunnel"
}
