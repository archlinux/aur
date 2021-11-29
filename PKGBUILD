# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='peeweeplus'
pkgname="python-${_pkgbase}"
pkgver=1.16.5
pkgrel=1
pkgdesc='Practical extension of a small, expressive ORM'
arch=('any')
url="https://gitlab.com/HOMEINFO/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-peewee' 'python-strflib')
optdepends=('python-argon2_cffi: for Argon2Field' 'python-authlib: for authlib integration')
makedepends=('git' 'python' 'python-setuptools' 'python-setuptools-git')
provides=("python-${_pkgbase}")
conflicts=("python-${_pkgbase}")
source=("${_pkgbase}::git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


package() {
    cd "${_pkgbase}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
