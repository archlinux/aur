# Maintainer: Sricharan <sricharanandra7@gmail.com>
pkgname=eurus-tui-bin
_pkgname=eurus
pkgver=0.1.0
pkgrel=1
pkgdesc="E2EE Terminal Chat Client (Binary Release)"
arch=('x86_64')
url="https://github.com/sricharanandra/eurus-tui"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'dbus')
provides=("$_pkgname")
conflicts=("$_pkgname" "eurus-tui-git")
source=("$url/releases/download/v$pkgver/$_pkgname")
sha256sums=('fa2a0b9d988aa6349b7955f47ecb0add54499214ec1c366a5ceec740881f60a4')

package() {
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
