# Maintainer: aarto <aarto@aur.archlinux.org>
_pkgname=turso
pkgname=$_pkgname-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='Turso Database is an in-process SQL database, compatible with SQLite.'
url='https://github.com/tursodatabase/turso'
license=('MIT')
arch=('x86_64')
depends=(glibc libgcc)
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/${_pkgname}_cli-$CARCH-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('b574d448434d1e256ceacc000d1a94eaf6d0e858f503104be73711ffd727de7f')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" ./**/${_pkgname}db
    install -Dm644 ./**/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
