# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pg_partman
pkgver=3.1.1
pkgrel=1
pkgdesc='Partition management extention for PostgreSQL'
arch=('x86_64')
url='https://github.com/keithf4/pg_partman'
license=('custom:PostgreSQL')
depends=('postgresql')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('103b495985f6df54e576f88bd45639858dd13dafc44abf4fc34cc1f88df6249b')

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
