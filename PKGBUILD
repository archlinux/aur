# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdrpbd
pkgver=2.0.1
pkgrel=1
pkgdesc="A daemon to handle ACPI power button event on VDR systems"
url="http://projects.vdr-developer.org/projects/vdrpbd"
arch=('any')
license=('GPL3')
depends=('perl-net-dbus')
makedepends=('perl')
backup=('etc/vdrpbd.conf')
source=("https://projects.vdr-developer.org/git/vdrpbd.git/snapshot/$pkgname-$pkgver.tar.bz2")
sha256sums=('4511ff354d8e430df7743e1bfedb05f580a358d7726cdbc57b1014aa9e88fede')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make BINDIR=/usr/bin DESTDIR="$pkgdir" PREFIX=/usr install
}
