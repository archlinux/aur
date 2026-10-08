pkgname=opentunnel-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Public URLs for local services, end-to-end encrypted'
url='https://opentunnel.xyz'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opentunnel')
conflicts=('opentunnel')
options=('!debug' '!strip')
source_aarch64=("opentunnel-0.3.0-aarch64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.3.0/opentunnel-linux-arm64.tar.gz")
sha256sums_aarch64=('b38d17c7971c9b08cafa2ea0105fa056ac2fe83a796c8b0486a033c4286554de')
source_x86_64=("opentunnel-0.3.0-x86_64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.3.0/opentunnel-linux-x64.tar.gz")
sha256sums_x86_64=('59c4c2adacfbfb525b5a9a5a79dc8af5514cbfcd7cc186bd7d36d8caa1ffdb27')

package() {
  install -Dm755 opentunnel "$pkgdir/usr/bin/opentunnel"
}
