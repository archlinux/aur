pkgname=plasma6-applets-eventcalendar
pkgver=1.0.1
pkgrel=1
pkgdesc="KDE Plasma 6 plasmoid for a calendar+agenda with weather that syncs to Google Calendar"
arch=('x86_64')
url="https://github.com/lenonk/plasma6-applet-eventcalendar"
license=('GPL')
depends=('plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cmake -B build -S plasma6-applet-eventcalendar-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

