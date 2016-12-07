# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=fmo
pkgver=1.0
pkgrel=1
pkgdesc="A tool for locating installed AUR orphans."
arch=('i686' 'x86_64')
url="https://github.com/craftyguy/fmo"
license=('GPL3')
depends=('cower')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('https://github.com/craftyguy/fmo/archive/1.0.tar.gz')
md5sums=('0c38355f1030a29bd9957b0b9f009f84')
prepare() {
        cd "$pkgname-$pkgver"
}

build() {
        cd "$pkgname-$pkgver"
}

check() {
        cd "$pkgname-$pkgver"
}

package() {
        cd "$pkgname-$pkgver"
        mkdir -p "$pkgdir/usr/bin"
        chmod +x "$pkgname"
        cp "$pkgname" "$pkgdir/usr/bin/"
}



