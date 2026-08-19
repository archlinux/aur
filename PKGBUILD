pkgname=shorkfetch
pkgver=0.6.0
pkgrel=1
pkgdesc="A cute shark-themed Linux fetch tool designed with speed, consistent output and vintage PC CPU & GPU support in mind"
arch=('x86_64' 'i686')
url="https://github.com/sharktastica/shorkfetch"
license=('GPLv3')
depends=('gcc')

source=("$pkgname-$pkgver.tar.gz::https://github.com/sharktastica/shorkfetch/archive/refs/tags/$pkgver.tar.gz")

sha256sums=('SKIP')

build()
{
    cd "$pkgname-$pkgver"
    make
}

package()
{
    cd "$pkgname-$pkgver"
    install -Dm755 shorkfetch "$pkgdir/usr/bin/shorkfetch"
}
