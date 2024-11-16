# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='smriti'
pkgname='smriti-bin'
pkgver=1.0.0
pkgrel=1
pkgdesc='Keep track of the commands your memory missed'
arch=('x86_64')
url="https://github.com/aspasht/$_pkgname"
license=('MIT')
source=("$_pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/cli-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('SKIP')
depends=('sqlite')

prepare() {
    mv "cli-x86_64-unknown-linux-gnu" "$_pkgname-$pkgver"
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
