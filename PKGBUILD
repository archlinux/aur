pkgname=opentunnel-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='Public URLs for local services, end-to-end encrypted'
url='https://opentunnel.xyz'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opentunnel')
conflicts=('opentunnel')
options=('!debug' '!strip')
source_aarch64=("opentunnel-0.4.1-aarch64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.4.1/opentunnel-linux-arm64.tar.gz")
sha256sums_aarch64=('d27c75d4439a434c7d606b5d471db264c9884438d171595e02c68379fb6605d8')
source_x86_64=("opentunnel-0.4.1-x86_64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.4.1/opentunnel-linux-x64.tar.gz")
sha256sums_x86_64=('2294fe786601ee6a405089f1e126c7c2010434ba0a61e9700f64bd5b4e8b8933')

package() {
  install -Dm755 opentunnel "$pkgdir/usr/bin/opentunnel"
}
