# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pg_partman
pkgver=3.1.2
pkgrel=1
pkgdesc='Partition management extention for PostgreSQL'
arch=('x86_64')
url='https://github.com/keithf4/pg_partman'
license=('custom:PostgreSQL')
depends=('postgresql')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('f13ecac21a6b4acb320765a95dc3b282711790ea48c91f46159196a87c0625f9')

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
