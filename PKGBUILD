# Maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>
pkgname=python-pytest-astropy-meta
_pyname=pytest-astropy
pkgver=0.6.0
pkgrel=1
pkgdesc="Metapackage for all the testing machinery used by the Astropy Project"
arch=('i686' 'x86_64')
url="https://github.com/astropy/pytest-astropy"
license=('BSD')
depends=('python-pytest>=3.1.0' 'python-pytest-doctestplus>=0.2.0' 'python-pytest-remotedata>=0.3.1' 'python-pytest-openfiles>=0.3.1' 'python-pytest-arraydiff>=0.1' 'python-pytest-astropy-header')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('c36b297bd42e75b18a5e711438a33bf3')

package() {
    msg2 "This is a metapackage. Nothing will be installed."
}
