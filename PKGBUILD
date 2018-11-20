# MacroPy

pkgname=python-macropy
_name=macropy
pkgver=1.1.0b2
pkgrel=1
pkgdesc="Syntactic macros for Python"
arch=('i686' 'x86_64')
url="https://github.com/lihaoyi/macropy"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')

source=("http://github.com/lihaoyi/macropy/archive/v"${pkgver}".tar.gz")

md5sums=('0a9705bbd9959cd0b7deb2ae483783b0')

package() 
{
    cd "${srcdir}"
    cd ${_name}-${pkgver}

    python setup.py install --root="${pkgdir}" --prefix=/usr
}
