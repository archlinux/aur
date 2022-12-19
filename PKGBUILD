# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdrpbd
pkgver=2.1.0
pkgrel=1
pkgdesc="A daemon to handle ACPI power button event on VDR systems"
url='https://github.com/M-Reimer/vdrpbd'
arch=('any')
license=('GPL3')
depends=('perl-net-dbus')
makedepends=('perl')
backup=('etc/vdrpbd.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('561b67f71a10811c0cfac3c501db614a8ab6d282fcc3d3895bbb5725aeed80d4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make BINDIR=/usr/bin DESTDIR="$pkgdir" PREFIX=/usr install
}
