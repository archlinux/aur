pkgname=opentunnel-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Public URLs for local services, end-to-end encrypted'
url='https://opentunnel.xyz'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opentunnel')
conflicts=('opentunnel')
options=('!debug' '!strip')
source_aarch64=("opentunnel-0.1.3-aarch64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.1.3/opentunnel-linux-arm64.tar.gz")
sha256sums_aarch64=('da28f249d7e9244429da1eabd0103074f88187c76bf754bb5bba9dc9bbef2040')
source_x86_64=("opentunnel-0.1.3-x86_64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.1.3/opentunnel-linux-x64.tar.gz")
sha256sums_x86_64=('fac543a9fc1326bc793193bed9a577d6803fcbbe5594fc09c2493a9d83c21dd4')

package() {
  install -Dm755 opentunnel "$pkgdir/usr/bin/opentunnel"
}
