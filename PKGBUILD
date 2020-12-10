# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='mcipc'
pkgname="python-${_pkgbase}"
pkgver=1.5.3
pkgrel=1
pkgdesc='Python 3 library and scripts for the RCON and Query protocol'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python')
makedepends=('git' 'python' 'python-setuptools' 'python-setuptools-git')
source=("${_pkgbase}::git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


package() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
