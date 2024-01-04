# Contributor: LPB <lpb612@gmail.com>
# Maintainer: gajjanag <gajjanag@alum.mit.edu>
pkgname=jemdoc-mathjax-git
pkgver=253.4b83aa4
pkgver() {
    cd "jemdoc_mathjax"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}
pkgrel=1
pkgdesc="a static site generator for creating simple academic websites"

arch=(any)
url="https://www.mit.edu/~wsshin/jemdoc+mathjax.html"
license=('GPL')
depends=(python)
source=('git+https://github.com/wsshin/jemdoc_mathjax.git')
sha1sums=('SKIP')

package() {
    mkdir -p $pkgdir/usr/bin
    cd "jemdoc_mathjax"
    install -Dm755 jemdoc $pkgdir/usr/bin
}

