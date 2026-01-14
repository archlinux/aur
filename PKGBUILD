pkgname=steamos-session-select
pkgver=1.0
pkgrel=1
pkgdesc='Allows to exit from `gamescope -- steam -steamos3`'
arch=(any)
url="https://github.com/ValveSoftware/steam-for-linux/issues/11241"
source=(steamos-session-select)
sha256sums=('7790da237d36868ff396b0c32b5c461bf7987212c5df7b3e95913d8ee3d37f37')

package() {
    install -Dm755 "$srcdir/steamos-session-select" "$pkgdir/usr/bin/steamos-session-select"
}
