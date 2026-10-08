pkgname=opentunnel-bin
pkgver=0.1.5
pkgrel=1
pkgdesc='Public URLs for local services, end-to-end encrypted'
url='https://opentunnel.xyz'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opentunnel')
conflicts=('opentunnel')
options=('!debug' '!strip')
source_aarch64=("opentunnel-0.1.5-aarch64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.1.5/opentunnel-linux-arm64.tar.gz")
sha256sums_aarch64=('baa104b6ca5bff3997fa79c8819cef36673d4e45c3e6c551e20e915d3fc565f5')
source_x86_64=("opentunnel-0.1.5-x86_64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.1.5/opentunnel-linux-x64.tar.gz")
sha256sums_x86_64=('63f4eb7cac5605bbf2153ac85065f6cfdd667b089f753235c5a83cf4da9d69f2')

package() {
  install -Dm755 opentunnel "$pkgdir/usr/bin/opentunnel"
}
