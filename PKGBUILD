# Maintainer: thepsauce <thepsauce at fensterchef dot org>

pkgname=fensterchef
pkgver=2.1
pkgrel=3
pkgdesc='Ratpoison inspired window manager for X11'
arch=(any)
url=https://github.com/DevByProxy/fensterchef
provides=(fensterchef)
license=(MIT)
depends=(libx11 'libxrandr>=1.2' libxcursor libxft fontconfig)
makedepends=(coreutils pkgconf)
source=(git+https://github.com/DevByProxy/fensterchef)
sha1sums=(SKIP)

build() {
    cd "$srcdir/fensterchef"
    /bin/sh make fensterchef
}

package() {
    cd "$srcdir/fensterchef"
    PREFIX="$pkgdir" /bin/sh make install
}
