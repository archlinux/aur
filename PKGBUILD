# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='mines'
pkgname="python-${_pkgbase}"
pkgver=1.0.2
pkgrel=1
pkgdesc='A mine sweeping game for the console'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-setuptools')
makedepends=('git' 'python' 'python-setuptools-scm')
source=("${_pkgbase}::git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


package() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
