pkgname=opentunnel-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Public URLs for local services, end-to-end encrypted'
url='https://opentunnel.xyz'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opentunnel')
conflicts=('opentunnel')
options=('!debug' '!strip')
source_aarch64=("opentunnel-0.1.2-aarch64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.1.2/opentunnel-linux-arm64.tar.gz")
sha256sums_aarch64=('09e8900696b62a3a6f9f55d16f5179e08aaab2931e25b4f03c6e368c4203ebce')
source_x86_64=("opentunnel-0.1.2-x86_64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.1.2/opentunnel-linux-x64.tar.gz")
sha256sums_x86_64=('9ece0527964d17b9f06902a51f45ad574db852b373683710bafae2f5cee12145')

package() {
  install -Dm755 opentunnel "$pkgdir/usr/bin/opentunnel"
}
