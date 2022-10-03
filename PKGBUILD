pkgver=0.1.1
pkgname=yues
pkgrel=1
pkgdesc='Yue library provider for any language/framework'
arch=(any)
depends=(
    luajit
    yue-lua51-bin
    lua51-filesystem
    lua51-socket
)
makedepends=(
)
url='https://github.com/KaMeHb-UA/yues'
license=('MIT')
source=("git+https://github.com/KaMeHb-UA/yues.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/opt"
    cp "$srcdir/yues/bin/yues" "$pkgdir/usr/bin/yues"
    cp -r "$srcdir/yues/src" "$pkgdir/opt/yues"
}
