# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=explain
pkgver=1.2.0
pkgrel=1
pkgdesc='Transform postgresql explain to a graph'
url="https://github.com/sanpii/$pkgname"
arch=('x86_64')
license=('MIT')
depends=()
optdepends=('graphviz' 'postgresql')
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('2c5057a9a1ed4a85f5ddc86a7b8d96b57e2be16d178a272956ee115e6b0b319e')

build()
{
    cd "$pkgname-$pkgver"

    make
}

package()
{
    cd "$pkgname-$pkgver"

    make install PREFIX="$pkgdir/usr"
}
