# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdrpbd
pkgver=1.0.0
pkgrel=1
pkgdesc="A daemon to handle ACPI power button event on VDR systems"
url="http://projects.vdr-developer.org/projects/vdrpbd"
arch=('any')
license=('GPL3')
depends=('perl-net-dbus')
makedepends=('perl')
backup=('etc/vdrpbd.conf')
source=('http://projects.vdr-developer.org/attachments/download/1855/vdrpbd-1.0.0.tar.xz')
md5sums=('ae72473654f82e28c13811c3468efdd6')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make BINDIR=/usr/bin DESTDIR="$pkgdir" PREFIX=/usr  install
}
