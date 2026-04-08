pkgname=vhelper
pkgver=0.1.3
pkgrel=1
pkgdesc='Make vtubing suck less on Linux'
arch=('any')
url='https://github.com/rikkichy/vhelper'
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'protontricks')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rikkichy/vhelper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "vhelper-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
}
