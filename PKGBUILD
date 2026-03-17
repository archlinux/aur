# Maintainer: Keon Cachia <keonfarrugia@gmail.com>

pkgname=kwm
pkgdesc="Kewuaa's window manager for the River compositor"
pkgver=0.1.2
pkgrel=1
arch=('x86_64')
url="https://github.com/kewuaa/kwm"
license=('GPL-3.0')
depends=('wayland' 'river' 'pixman' 'fcft' 'libxkbcommon' )
makedepends=('zig' 'wayland-protocols')
install=kwm.install
source=(https://github.com/kewuaa/kwm/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('9382e3eeeb8a84c0544f8a750d23bace3cc7bf0ee2ad7629669bb65bad223042')

package(){
  cd $pkgname-$pkgver
  zig build --prefix $pkgdir/usr -Doptimize=ReleaseSafe
}


