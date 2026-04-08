pkgname=vhelper
pkgver=0.1.1
pkgrel=1
pkgdesc='Make vtubing suck less on Linux'
arch=('any')
url='https://github.com/rikkichy/VHelper'
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'protontricks')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rikkichy/VHelper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "VHelper-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
}
