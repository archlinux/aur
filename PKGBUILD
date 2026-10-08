pkgname=opentunnel-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Public URLs for local services, end-to-end encrypted'
url='https://opentunnel.xyz'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opentunnel')
conflicts=('opentunnel')
options=('!debug' '!strip')
source_aarch64=("opentunnel-0.1.4-aarch64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.1.4/opentunnel-linux-arm64.tar.gz")
sha256sums_aarch64=('a2d9ca2bf20c5dfa07f61bd81e172a263bc221162d14998f283c0ef8219e0b20')
source_x86_64=("opentunnel-0.1.4-x86_64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.1.4/opentunnel-linux-x64.tar.gz")
sha256sums_x86_64=('38667d36d72da6d28384cb4301f8db79ba60fe0386b074d4cbb8e8fa4cc8a915')

package() {
  install -Dm755 opentunnel "$pkgdir/usr/bin/opentunnel"
}
