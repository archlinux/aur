# Maintainer: aarto <aarto@aur.archlinux.org>
_pkgname=limbo
pkgname=$_pkgname-bin
pkgver=0.0.9
pkgrel=1
pkgdesc='Limbo is a work-in-progress, in-process OLTP database management system, compatible with SQLite.'
url='https://github.com/tursodatabase/limbo'
license=('MIT')
arch=('x86_64')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("https://github.com/penberg/limbo/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('81e70bd7dc32799515d17e26c5af49cf963664d5542ab96e5d5113c95d31b68f')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" ./**/$_pkgname
    install -Dm644 ./**/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
