pkgname=opentunnel-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='Public URLs for local services, end-to-end encrypted'
url='https://opentunnel.xyz'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opentunnel')
conflicts=('opentunnel')
options=('!debug' '!strip')
source_aarch64=("opentunnel-0.2.2-aarch64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.2.2/opentunnel-linux-arm64.tar.gz")
sha256sums_aarch64=('14d51c51f8a1a3abcde5335a73d02bd905282107d8595ded1242ca1885a2b7c7')
source_x86_64=("opentunnel-0.2.2-x86_64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.2.2/opentunnel-linux-x64.tar.gz")
sha256sums_x86_64=('6a4ba3ea2a350efa422049c87f480cc68eab414bfde320e04177263179e2ae16')

package() {
  install -Dm755 opentunnel "$pkgdir/usr/bin/opentunnel"
}
