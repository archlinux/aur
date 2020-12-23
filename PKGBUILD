# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pg_partman
pkgver=4.4.1
pkgrel=1
pkgdesc='Partition management extention for PostgreSQL'
arch=('x86_64')
url="https://github.com/pgpartman/$pkgname"
license=('custom:PostgreSQL')
depends=('python' 'postgresql')
makedepends=('llvm')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('72ca9dcb0cdfe2a2a8b0295b054e4e1245c6fd804061c8282fa5006163e5ec98')

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
