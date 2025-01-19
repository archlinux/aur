# Maintainer: aarto <aarto@aur.archlinux.org>
_pkgname=limbo
pkgname=$_pkgname-bin
pkgver=0.0.13
pkgrel=1
pkgdesc='Limbo is a work-in-progress, in-process OLTP database management system, compatible with SQLite.'
url='https://github.com/tursodatabase/limbo'
license=('MIT')
arch=('x86_64')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$pkgname-$pkgver.tar.xz::https://github.com/penberg/limbo/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('4465caa97faef4c1a4e297ba5bcf2ab29e7f25b3e5c97c3c6669d61ad91439b3')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" ./**/$_pkgname
    install -Dm644 ./**/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
