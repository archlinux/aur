pkgname=opentunnel-bin
pkgver=0.6.2
pkgrel=1
pkgdesc='Public URLs for local services, end-to-end encrypted'
url='https://opentunnel.xyz'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opentunnel')
conflicts=('opentunnel')
options=('!debug' '!strip')
source_aarch64=("opentunnel-0.6.2-aarch64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.6.2/opentunnel-linux-arm64.tar.gz")
sha256sums_aarch64=('3136e3b66157db18e2f2b86bdcbf1c88016b2daeee70c0396a5c9d188eb6f293')
source_x86_64=("opentunnel-0.6.2-x86_64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.6.2/opentunnel-linux-x64.tar.gz")
sha256sums_x86_64=('ce9b654b686beb0d23c87be9816ec71da950f41a4ddc0c8f33396eef871dc861')

package() {
  install -Dm755 opentunnel "$pkgdir/usr/bin/opentunnel"
}
