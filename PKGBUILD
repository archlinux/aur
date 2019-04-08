# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=unifi-network-controller
pkgver=5.10.20
pkgrel=1
pkgdesc="An end-to-end system of network devices across different locations."
arch=('x86_64')
url="https://unifi-sdn.ui.com/"
license=('custom')
makedepends=()
depends=()
source=("https://dl.ubnt.com/unifi/${pkgver}/unifi_sysvinit_all.deb")
sha256sums=('669b3332e822694e9e52264081c8fa5abcb3dddc3602d0b2f5c8c775f8e6cffd')

prepare() {
  rm control.tar.gz
  rm debian-binary
  tar xJf data.tar.xz
}

package() {
  cp -Rfp $srcdir/* $pkgdir/
}
