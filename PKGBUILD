# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pg_partman
pkgver=4.7.3
pkgrel=1
pkgdesc='Partition management extention for PostgreSQL'
arch=('x86_64')
url="https://github.com/pgpartman/$pkgname"
license=('custom:PostgreSQL')
depends=('python' 'postgresql')
makedepends=('llvm')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('f6b376da1ddfbf9482b3a10f3e2bb414e546e67bec32acca5a9eb7d39719036e')

build()
{
    cd "$pkgname-$pkgver"

    make
}

package()
{
    cd "$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install
}
