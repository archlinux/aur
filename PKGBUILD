# Maintainer: aarto <aarto@aur.archlinux.org>
_pkgname=limbo
pkgname=$_pkgname-bin
pkgver=0.0.21
pkgrel=1
pkgdesc='Limbo is a work-in-progress, in-process OLTP database management system, compatible with SQLite.'
url='https://github.com/tursodatabase/limbo'
license=('MIT')
arch=('x86_64')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/${_pkgname}_cli-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('2532f88b5b438701c999ce4b08c27abcfe1080768bdbb85fefd23b390c3199d6')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" ./**/$_pkgname
    install -Dm644 ./**/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
