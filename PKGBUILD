# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pg_partman
pkgver=4.4.0
pkgrel=1
pkgdesc='Partition management extention for PostgreSQL'
arch=('x86_64')
url="https://github.com/pgpartman/$pkgname"
license=('custom:PostgreSQL')
depends=('python' 'postgresql')
makedepends=('llvm')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('d035af8a98798ec8a2e547d38c320e1b90ebfa8c41feb49b926076dcf71777f2')

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
