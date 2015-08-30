# Maintainer: Ianis G. Vasilev <mail@ivasilev.net>

pkgname=wintoggle-git
pkgver=2.0
pkgrel=0
pkgdesc='A simple xdotool-based window state toggler'
arch=('x86_64')
url='https://github.com/v--/wintoggle'
license=('BSL-1.0')
depends=('libx11')
makedepends=('git libx11')
provides=('wintoggle')
conflicts=('wintoggle')
source='git://github.com/v--/wintoggle.git'
md5sums=('SKIP')

package() {
    cd "$srcdir/wintoggle"
    dub build -b release
    mkdir -p "$pkgdir/usr/bin"
    cp "wintoggle" "$pkgdir/usr/bin/wintoggle"
}
