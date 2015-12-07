# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgbase=python-txws
_pkgbase=txWS
pkgname=(python-txws python2-txws)
pkgver=0.9.1
pkgrel=1
pkgdesc="Twisted WebSockets"
arch=("any")
url="https://github.com/MostAwesomeDude/txWS"
license=("MIT")
makedepends=('git')
source=("git+https://github.com/MostAwesomeDude/txWS.git#tag=${pkgver}")
sha256sums=('SKIP')

package_python-txws() {
    depends=('python-twisted' 'python-six')

    cd "$srcdir/${_pkgbase}"
    python setup.py install --root=$pkgdir
}

package_python2-txws() {
    depends=('python2-twisted' 'python2-six')

    cd "$srcdir/${_pkgbase}"
    python2 setup.py install --root=$pkgdir
}
