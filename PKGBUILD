# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pg_partman
pkgver=3.1.3
pkgrel=1
pkgdesc='Partition management extention for PostgreSQL'
arch=('x86_64')
url='https://github.com/keithf4/pg_partman'
license=('custom:PostgreSQL')
depends=('python' 'postgresql')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('64e236c9a4d45369a61b33ed4c976be0bb85c4ddd3d97a8778768ad7dad7c2ae')

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
