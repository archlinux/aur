# Maintainer: 71e6fd52 <DAStudio.71e6fd52@gmail.com>

pkgbase=('python-genpac')
pkgname=('python-genpac')
_module='genpac'
pkgver='2.0.1'
pkgrel=1
pkgdesc="convert gfwlist to pac, custom rules supported."
url="https://github.com/JinnLynn/genpac"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/g/genpac/genpac-${pkgver}.tar.gz")
md5sums=('8a653ac6d3f540eff4308ad7288e5819')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
