pkgname=opentunnel-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Public URLs for local services, end-to-end encrypted'
url='https://opentunnel.xyz'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opentunnel')
conflicts=('opentunnel')
options=('!debug' '!strip')
source_aarch64=("opentunnel-0.1.0-aarch64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.1.0/opentunnel-linux-arm64.tar.gz")
sha256sums_aarch64=('1a0605740df3bf2e11c934481740e82f73265e0567c535fa78a01f6f0e4bd3fc')
source_x86_64=("opentunnel-0.1.0-x86_64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.1.0/opentunnel-linux-x64.tar.gz")
sha256sums_x86_64=('c250dee99bcf0f7af7a9ee220457f54c17a3099d8024e956d28bb30caf69b474')

package() {
  install -Dm755 opentunnel "$pkgdir/usr/bin/opentunnel"
}
