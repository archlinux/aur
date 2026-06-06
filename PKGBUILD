# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdrpbd
pkgver=2.1.1
pkgrel=1
pkgdesc="A daemon to handle ACPI power button event on VDR systems"
url='https://github.com/M-Reimer/vdrpbd'
arch=('any')
license=('GPL3')
depends=('perl-net-dbus')
makedepends=('perl')
backup=('etc/vdrpbd.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('38c3e07d06865e4d7ca90b44e94b071845ec3ee94ab57e896d83b116bf1e008f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make BINDIR=/usr/bin DESTDIR="$pkgdir" PREFIX=/usr install
}
