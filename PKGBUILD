# Maintainer: Sricharan <sricharanandra7@gmail.com>
pkgname=eurus-tui-bin
_pkgname=eurus
pkgver=0.1.1
pkgrel=3
pkgdesc="E2EE Terminal Chat Client (Binary Release)"
arch=('x86_64')
url="https://github.com/sricharanandra/eurus-tui"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'dbus')
provides=("$_pkgname")
conflicts=("$_pkgname" "eurus-tui-git")
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname")
sha256sums=('c8e28e8c62a3d80d99d4d45a510b6ed21473f43cfa708df2ed5300363cc06bb0')

package() {
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
