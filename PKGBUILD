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
sha256sums_aarch64=('db09fc4da333f9b1e97ab2893f20e3243c2bb901e13ec4b129c48299ef0ac6f0')
source_x86_64=("opentunnel-0.1.4-x86_64.tar.gz::https://github.com/anomalyco/opentunnel/releases/download/v0.1.4/opentunnel-linux-x64.tar.gz")
sha256sums_x86_64=('e1c1969c50394a733403d7cb91117998a61be5d6a35ed5aa30582bb432d1b5e0')

package() {
  install -Dm755 opentunnel "$pkgdir/usr/bin/opentunnel"
}
