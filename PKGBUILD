# Maintainer: aarto <aarto@aur.archlinux.org>
_pkgname=limbo
pkgname=$_pkgname-bin
pkgver=0.0.8
pkgrel=1
pkgdesc='Limbo is a work-in-progress, in-process OLTP database management system, compatible with SQLite.'
url='https://github.com/tursodatabase/limbo'
license=('MIT')
arch=('x86_64')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/penberg/limbo/releases/download/v$pkgver/$_pkgname-$arch-unknown-linux-gnu.tar.xz")
sha256sums=('14696865da1a95cedcef91c11d62d5fd24dd3628564e16532f3f9aa8855c1ad1')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" $_pkgname
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
