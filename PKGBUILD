# Maintainer: 71e6fd52 <DAStudio.71e6fd52@gmail.com>

pkgbase=('python2-gfwlist2privoxy')
pkgname=('python2-gfwlist2privoxy')
_module='gfwlist2privoxy'
pkgver='1.0.3'
pkgrel=1
pkgdesc="convert gfwlist to privoxy action file"
url="https://github.com/snachx/gfwlist2privoxy"
depends=('python2')
makedepends=('python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/g/${_module}/${_module}-${pkgver}.tar.gz")
md5sums=('fe8956e340ed72dd1a662da7a11b20ce')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
