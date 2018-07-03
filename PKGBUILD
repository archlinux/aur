# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pg_partman
pkgver=3.2.0
pkgrel=1
pkgdesc='Partition management extention for PostgreSQL'
arch=('x86_64')
url='https://github.com/keithf4/pg_partman'
license=('custom:PostgreSQL')
depends=('python' 'postgresql')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('34f3850cd802ee5b9b279b403c64f6bb135071d3eb742bfaeb9b87ff159fcfc1')

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
