# Maintainer: Faerbit <faerbit at gmail dot com>
# Original author: kalenz <archlinux@kalenz.fr>

pkgname=("python2-androguard" python-androguard)
pkgbase=python2-androguard
pkgver=3.3.5
pkgrel=1
pkgdesc="Python framework for Android application analysis."
arch=("any")
url="https://github.com/androguard/androguard/"
license=("Apache")
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/androguard/androguard/archive/v${pkgver}.tar.gz")
md5sums=('903bd3b46cdd677757227edbd652a455')

package_python2-androguard() {
    depends=("python2" "python2-setuptools")
    optdepends=(
        "ipython2: interactive analysis support"
        "python2-pygments: color support"
        #"pydot: CFG support"
        "python2-magic: file identification support"
        "sparsehash: elsim support"
        "muparser: elsim support"
        "snappy: elsim support"
        "bzip2: elsim support"
        "zlib: elsim support"
        #"psyco2-svn: acceleration support"
        "python2-pyside: GUI"
    )
    cd "$srcdir/androguard-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-androguard() {
    depends=("python" "python-setuptools")
    optdepends=(
        "ipython: interactive analysis support"
        "python-pygments: color support"
        #"pydot: CFG support"
        "python-magic: file identification support"
        "sparsehash: elsim support"
        "muparser: elsim support"
        "snappy: elsim support"
        "bzip2: elsim support"
        "zlib: elsim support"
        #"psyco-svn: acceleration support"
        "python-pyside: GUI"
    )
    cd "$srcdir/androguard-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

}
