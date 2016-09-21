pkgbase=('python-mplleaflet')
pkgname=('python-mplleaflet')
_module='mplleaflet'
pkgver='0.0.5'
pkgrel=1
pkgdesc="Convert Matplotlib plots into Leaflet web maps"
url="http://github.com/jwass/mplleaflet"
depends=('python' 'python-six' 'python-jinja')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://pypi.python.org/packages/05/b3/e68ff575ef0872e096878c75f602e76b06ca44d7038d69d867c7b800745b/mplleaflet-${pkgver}.tar.gz")
md5sums=('cf8ec819862e4486f477fb71101477f1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
