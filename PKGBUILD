# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='ldaptools'
pkgver=1.0.5
pkgrel=2
pkgdesc='Easily manage LDAP users and groups'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'python-setuptools')
makedepends=('git' 'python-setuptools-scm')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "${pkgname}"
    python setup.py build
}

package() {
    cd "${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}
