# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>
# $Id$
# vim:set ts=2 sw=2 et:
pkgname=gkrellm-snmp
pkgver=1.1
pkgrel=1
pkgdesc="A GKrellM plugin to read SNMP agents"
arch=("x86" "x86_64")
url="http://triq.net/plugin/gkrellm-snmp"
license=('GPL')
depends=(gtk openssl gkrellm net-snmp)
builddepends=(pkg-config)
source=(http://triq.net/files/${pkgname/-/_}-$pkgver.tar.gz)
noextract=()

build() {
  cd "$srcdir/${pkgname/-/_}-$pkgver"
  make
}

package() {
  cd "$srcdir/${pkgname/-/_}-$pkgver"
  make DESTDIR="$pkgdir/" install
}
md5sums=('59ecb86bc925e852709206f9d1b0aaa7')
