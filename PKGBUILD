# Maintainer: Azuki <support@azukiapp.com>
pkgname='libnss-resolver'
pkgver=0.3.0
pkgrel=1
pkgdesc=" A Linux extension that adds support to the /etc/resolver/[suffix]."
arch=('x86_64')
url="https://github.com/azukiapp/libnss-resolver"
license=('Apache')
depends=('glibc')
makedepends=('clang' 'wget' 'scons' )
conflicts=(${pkgname}-git)
source=("https://github.com/azukiapp/libnss-resolver/archive/v0.3.0.tar.gz")
md5sums=('SKIP')
install=${pkgname}.install

package() {
    cd "$srcdir/$pkgname-$pkgver"
    scons prefix="$pkgdir/usr/lib" local-install
}
