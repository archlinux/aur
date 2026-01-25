# Maintainer: Sricharan <sricharanandra7@gmail.com>
pkgname=eurus-tui-bin
_pkgname=eurus
pkgver=0.2.2
pkgrel=1
pkgdesc="E2EE Terminal Chat Client (Binary Release)"
arch=('x86_64')
url="https://github.com/sricharanandra/eurus-tui"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'dbus' 'alsa-lib' 'openssl')
provides=("$_pkgname")
conflicts=("$_pkgname" "eurus-tui-git")
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname")
sha256sums=('a8a0e8ba9734d17d034d59d4aa01a137e97a373c21bf19f40cca0968e41a5a76')

package() {
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
