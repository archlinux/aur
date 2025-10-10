pkgname=tudify-simpleweb
pkgver=3.0
pkgrel=1
pkgdesc="A lightweight PyQt5-based browser with a custom engine"
arch=('x86_64')
url="https://github.com/Tudify/SimpleWeb"
license=('custom')
depends=('qt5-base' 'qt5-webengine' 'python')
source=("https://github.com/Tudify/SimpleWeb/releases/download/SimpleWeb-main/SimpleWeb-archlinux")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/SimpleWeb-archlinux" "$pkgdir/usr/bin/simpleweb"
}
