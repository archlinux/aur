pkgname=opentunnel-bin
pkgver=0.5.2
pkgrel=1
pkgdesc='Public URLs for local services, end-to-end encrypted'
url='https://opentunnel.xyz'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opentunnel')
conflicts=('opentunnel')
options=('!debug' '!strip')
source_aarch64=("opentunnel-0.5.2-aarch64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.5.2/opentunnel-linux-arm64.tar.gz")
sha256sums_aarch64=('5fba9f04625f3e32faf3fae8354a3fccfff694135ef1d2a68bd860284e02bbbe')
source_x86_64=("opentunnel-0.5.2-x86_64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.5.2/opentunnel-linux-x64.tar.gz")
sha256sums_x86_64=('0cb37528bb4ad449c45da9efdff243ea6896163628d7ef0bb41c9cf86d14d885')

package() {
  install -Dm755 opentunnel "$pkgdir/usr/bin/opentunnel"
}
