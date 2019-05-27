# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='mcipc'
pkgver=1.0.2
pkgrel=1
pkgdesc='Python 3 library and scripts for the RCON and Query protocol'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'python-docopt')
makedepends=('git' 'python' 'python-setuptools' 'python-setuptools-git')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
