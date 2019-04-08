# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=unifi-sdn-controller
pkgver=5.6.40
pkgrel=1
pkgdesc="An end-to-end system of network devices across different locations."
arch=('x86_64')
url="https://unifi-sdn.ui.com/"
license=('custom')
makedepends=()
depends=()
source=("https://dl.ubnt.com/unifi/${pkgver}/unifi_sysvinit_all.deb")
sha256sums=('2a86a731f2261d84db5d41f87a5a60e6f2e34c2d5c6d34d0e12cab9f5b3e6b44')

prepare() {
  rm control.tar.gz
  rm debian-binary
  tar xJf data.tar.xz
}

package() {
  cp -Rfp $srcdir/* $pkgdir/
}
