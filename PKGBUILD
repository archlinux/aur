# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=muviz
pkgver=1.1.1
pkgrel=2
pkgdesc='Music visualizer'
arch=(x86_64)
url='https://github.com/xyproto/muviz'
license=(MIT GPL3)
depends=(ffts glfw libpulse rapidjson)
makedepends=(cxx git)
source=("git+$url#commit=f128ff2f2fcc871928c5fed153187617a38f0afa") # tag: v1.1.1
b2sums=(SKIP)

package() {
  DESTDIR="$pkgdir" PREFIX=/usr cxx -C $pkgname install
  install -Dm644 $pkgname/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
