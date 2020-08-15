# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdrpbd
pkgver=2.1.0
pkgrel=1
pkgdesc="A daemon to handle ACPI power button event on VDR systems"
url="http://projects.vdr-developer.org/projects/vdrpbd"
arch=('any')
license=('GPL3')
depends=('perl-net-dbus')
makedepends=('perl')
backup=('etc/vdrpbd.conf')
source=("https://projects.vdr-developer.org/git/vdrpbd.git/snapshot/$pkgname-$pkgver.tar.bz2")
sha256sums=('3882eb918217d190a5a1742dff454ad81136360d7d91d278a5883832ab993539')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make BINDIR=/usr/bin DESTDIR="$pkgdir" PREFIX=/usr install
}
