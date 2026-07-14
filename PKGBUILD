# Maintainer: aarto <aarto@aur.archlinux.org>
_pkgname=turso
pkgname=$_pkgname-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='Turso Database is an in-process SQL database, compatible with SQLite.'
url='https://github.com/tursodatabase/turso'
license=('MIT')
arch=('x86_64')
depends=(glibc libgcc)
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/${_pkgname}_cli-$CARCH-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('b1e07c83ab63328807514d5088109a35d53c83060aaafff2b6afedf78705ae54')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" ./**/${_pkgname}db
    install -Dm644 ./**/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
