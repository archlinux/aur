# Maintainer: bilabila <bilabila@qq.com>
pkgname=num2f11
pkgver=0.0.1
pkgrel=1
pkgdesc="remap numlock to f11 in X"
arch=(x86_64)
provides=($pkgname)
conflicts=($pkgname)
license=(custom)
source=($pkgname)
sha512sums=(0922ee5d195d66003059112dfcdcd948eaa171463c0cf5c4c0aa46e55030a9a6dcb55ea6e2ef211a195e661599dcc7c53aed328b4c26ec388f21e41cd2958b85)
install=$pkgname.install
package() {
    d="$pkgdir"/usr/share/X11/xkb/symbols/$pkgname
    install -Dm644 $pkgname "$d"
}
