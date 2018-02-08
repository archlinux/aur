# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=clipnotify
pkgver=1.0.0
pkgrel=1
pkgdesc='Polling-free clipboard notifier'
url='https://github.com/cdown/clipnotify'
arch=('any')
license=('Public Domain')
depends=('libx11' 'libxfixes')

source=("https://github.com/cdown/clipnotify/archive/${pkgver}.zip")
md5sums=('da59bbb2cae9b3bf74200fe46d0630bf')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 clipnotify "$pkgdir/usr/bin/clipnotify"
}
