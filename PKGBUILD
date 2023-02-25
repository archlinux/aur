# Maintainer: Olivia May <olmay@tuta.io>
_host=github.com
_maintainer=olivia-livs

pkgname=livsdiary
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple, free/libre and open source command-line diary"
arch=('x86_64')
url="https://$_host/$_maintainer/$pkgname"
license=('GPL3')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('94842e015512bcdc899e69a85194aa5046c7afff4f8f24476d833e0a10024d52')

build()
{
        cd "$pkgname-$pkgver"
        make
}
package()
{
        cd "$pkgname-$pkgver"
        install -D $pkgname.o "${pkgdir}/usr/bin/$pkgname"
}
