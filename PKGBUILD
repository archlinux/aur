# Maintainer: Rijnder Wever <rien334 + gmail.com>
# Contributor: Jeremy Ruten <jeremy.ruten@gmail.com>
# Contributor: Gustavo Lopes <mail@geleia.net>

pkgname=xrandr-invert-colors
pkgver=0.02
pkgrel=1
pkgdesc="Simple utility that inverts colors on all screens, using XrandR"
arch=('i686' 'x86_64')
url="https://github.com/zoltanp/xrandr-invert-colors"
license=('GPL3')
depends=(libxau libxdmcp libxcb libxrandr)
source=('https://github.com/zoltanp/xrandr-invert-colors/archive/v0.02.tar.gz')
md5sums=('f83e222ff6249d0563c9977368ab32fd')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m=755 xrandr-invert-colors.bin \
    "$pkgdir"/usr/bin/xrandr-invert-colors
}
