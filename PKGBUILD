# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pg_partman
pkgver=3.1.0
pkgrel=1
pkgdesc='Partition management extention for PostgreSQL'
arch=('x86_64')
url='https://github.com/keithf4/pg_partman'
license=('custom:PostgreSQL')
depends=('postgresql')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('180d49d98dea5e7500ed8d53d397f13854fc3e6b2159d808dfd4afe900d98187')

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
