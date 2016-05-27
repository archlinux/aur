# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python2-pycifrw'
_pkgname='PyCifRW'
pkgver=4.2
pkgrel=1
pkgdesc="CIF/STAR file support for Python"
url="https://bitbucket.org/jamesrhester/pycifrw"
arch=("any")
license=('Python-2.0')
makedepends=('python2-setuptools')
depends=('python2-numpy')
source=("https://bitbucket.org/jamesrhester/pycifrw/downloads/$_pkgname-$pkgver.tar.gz")
md5sums=('2b190e43ee4d629ececf81dfe7160f1c')

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
