# Maintainer: Azuki <support@azukiapp.com>
pkgname='libnss-resolver'
pkgver=0.3.0
pkgrel=1
pkgdesc="A Linux extension that adds support to the /etc/resolver/[suffix]."
arch=('x86_64')
url="https://github.com/azukiapp/libnss-resolver"
license=('Apache')
depends=('glibc')
makedepends=('make' 'fakeroot' 'clang' 'wget' 'scons')
conflicts=(${pkgname}-git)
pkgcommit=00b56693dd20d9c4e60c56216a92b8a00c0aa955
source=("https://github.com/azukiapp/libnss-resolver/archive/$pkgcommit.zip")
md5sums=('SKIP')
install=${pkgname}.install

package() {
    cd "$srcdir/$pkgname-$pkgcommit"
    scons prefix="$pkgdir/usr/lib" local-install
}
