# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='mcwb'
pkgname="python-${_pkgbase}"
pkgver=0.0.1
pkgrel=1
pkgdesc='Python 3 library for Minecraft world manipulation via RCON commands'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-mcipc')
makedepends=('git' 'python' 'python-setuptools' 'python-setuptools-git')
source=("${_pkgbase}::git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


package() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
