# Maintainer: Olivia May <olmay@tuta.io>
_host=github.com
_maintainer=olivia-livs

pkgname=livsdiary
pkgver=1.3.0
pkgrel=1
pkgdesc="A simple, free/libre and open source command-line diary"
arch=('x86_64')
url="https://$_host/$_maintainer/$pkgname"
license=('GPL3')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('a55e6acbaacc2ac465824406e20a78403ea1bd6fe37caf811a65bf2828e8b63f')

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
