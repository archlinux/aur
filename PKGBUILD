# Maintainer: Sricharan <sricharanandra7@gmail.com>
pkgname=eurus-tui-bin
_pkgname=eurus
pkgver=0.2.4
pkgrel=1
pkgdesc="E2EE Terminal Chat Client (Binary Release)"
arch=('x86_64')
url="https://github.com/sricharanandra/eurus-tui"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'dbus' 'alsa-lib' 'openssl')
provides=("$_pkgname")
conflicts=("$_pkgname" "eurus-tui-git")
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname")
sha256sums=('c4bec7fcc09d4f66b97455b7d95c75b771b056a0a4e63f4d59b2d1abb0d24368')

package() {
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
