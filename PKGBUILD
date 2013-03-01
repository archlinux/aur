# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Han Xiao <arak.hx@gmail.com>

pkgname=python2-gvgen
_pythonname='gvgen'
pkgver=0.9.1
pkgrel=2
pkgdesc='Generates dot language files for easy scripting, to be processed with graphviz.'
arch=('any')
url='http://www.picviz.com/sections/opensource/gvgen.html'
license=('GPL2')
depends=('python2')
makedepends=()
source=("http://www.picviz.com/sections/community/${_pythonname}-latest.tar.gz")

build() {
    cd "$srcdir/${_pythonname}-latest"
    python2 setup.py install --prefix=/usr --root=$pkgdir
}

md5sums=('950f6f5384ea21b1a3ac502cda266b05')
sha256sums=('73fadff46ceea5309c2e8e9b47ba96917bfd9ae109c6228a994938e73efef39a')
