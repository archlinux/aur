# Maintainer: Sricharan <sricharanandra7@gmail.com>
pkgname=eurus-tui-bin
_pkgname=eurus
pkgver=0.4.2
pkgrel=1
pkgdesc="E2EE Terminal Chat Client (Binary Release)"
arch=('x86_64')
url="https://github.com/sricharanandra/eurus-tui"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'dbus' 'alsa-lib' 'openssl')
provides=("$_pkgname")
conflicts=("$_pkgname" "eurus-tui-git")
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname")
sha256sums=('c3554976dfe57655261ed253a11ebe664525b7ee98c1513f967df4345cb4c04e')

package() {
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
