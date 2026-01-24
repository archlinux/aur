# Maintainer: Sricharan <sricharanandra7@gmail.com>
pkgname=eurus-tui-bin
_pkgname=eurus
pkgver=0.1.4
pkgrel=1
pkgdesc="E2EE Terminal Chat Client (Binary Release)"
arch=('x86_64')
url="https://github.com/sricharanandra/eurus-tui"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'dbus')
provides=("$_pkgname")
conflicts=("$_pkgname" "eurus-tui-git")
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname")
sha256sums=('793903be07f9fa6029385542ce349eebfcfe0fa9d57bcd95f0651ef9f6795279')

package() {
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
