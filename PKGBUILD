# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

_name='configfile'

pkgname="python-${_name}"
pkgver='1.2.4'
pkgrel=2
pkgdesc="Python library for dynamically parsing and editing configuration files with support for subsections."
arch=('any')
url="https://kynikos.github.io/lib.py.configfile"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3cb441db800c7a1c3d265e8f63b0a568b0a55150479984e99561f6adb9268c51')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
