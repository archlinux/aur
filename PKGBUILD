# Maintainer: Azuki <support@azukiapp.com>
_pkgname='libnss-resolver'
pkgname=${_pkgname}-git
pkgver=0.3.0
pkgrel=1
pkgdesc=" A Linux extension that adds support to the /etc/resolver/[suffix]."
arch=('x86_64')
url="https://github.com/azukiapp/libnss-resolver"
license=('Apache')
depends=('glibc')
makedepends=('git' 'clang' 'wget' 'scons' )
source=("git+https://github.com/azukiapp/libnss-resolver.git")
md5sums=('SKIP')
install=${pkgname}.install

package() {
    cd "$_pkgname"
    scons prefix="$pkgdir/usr/lib" local-install
}
