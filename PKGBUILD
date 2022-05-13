# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pg_partman
pkgver=4.6.2
pkgrel=1
pkgdesc='Partition management extention for PostgreSQL'
arch=('x86_64')
url="https://github.com/pgpartman/$pkgname"
license=('custom:PostgreSQL')
depends=('python' 'postgresql')
makedepends=('llvm')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('81ec4371985fd2f95ce4321b63371c0a308d476e57e6a4b7a5e23d73a5e4b218')

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
