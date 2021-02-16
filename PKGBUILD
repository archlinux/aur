# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
pkgname=gkrellm-snmp
pkgver=1.1
pkgrel=1
pkgdesc="A GKrellM plugin to read SNMP agents"
arch=("x86" "x86_64")
url="https://triq.net/plugin/gkrellm-snmp"
license=('GPL')
depends=(gtk openssl gkrellm net-snmp)
source=(https://triq.net/files/${pkgname/-/_}-$pkgver.tar.gz)

build() {
  cd "$srcdir/${pkgname/-/_}-$pkgver"
  make
}

package() {
  cd "$srcdir/${pkgname/-/_}-$pkgver"
  make DESTDIR="$pkgdir/" install
}
md5sums=('59ecb86bc925e852709206f9d1b0aaa7')