# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Nikita Ukhrenkov <thekit@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

pkgname=osso-systemui-dbus-headers
_pkgname=osso-systemui-dbus-dev
pkgver=0.1.4
pkgrel=1
pkgdesc="Headers for D-Bus calls provided by the system UI, and the signals emitted by it"
url="https://github.com/maemo-leste/$_pkgname"
arch=(any)
license=(LGPL2)
makedepends=(doxygen git)
checkdepends=()
groups=(maemo)
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  make
 }

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" make install
}
