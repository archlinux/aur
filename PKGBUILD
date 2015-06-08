# Contributor: Yuri Albuquerque <yuridenommus at gmail dot com>
pkgname=cl-launch
pkgver=4.1.3
pkgrel=1
pkgdesc="utility to make Lisp software easily invokable from the command-line"
arch=('any')
url="http://www.cliki.net/cl-launch"
license=('LLGPL')
depends=()
source=("http://common-lisp.net/project/xcvb/cl-launch/cl-launch-$pkgver.tar.gz")
md5sums=('a62b099e74f68997e3fda0c6ecdd249a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ## Build
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    mkdir -p $pkgdir/usr/bin
    make PREFIX=$pkgdir/usr install
}
