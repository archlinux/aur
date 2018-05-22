# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=ansible-review
pkgver=0.13.4
pkgrel=1
pkgdesc="Reviews Ansible playbooks, roles and inventory and suggests improvements."
url="https://github.com/willthames/ansible-review"
depends=('ansible-lint' 'python-yaml' 'python-appdirs' 'python-unidiff' 'flake8')
makedepends=('python2-nose')
license=('MIT')
arch=('any')
source=("https://github.com/willthames/ansible-review/archive/v${pkgver}.tar.gz")
sha256sums=('8071e884a8e9f388eeb15b8c88ec915cc3ede89303fa937383c4918e5ceb5ef4')

build() {
  cd "${srcdir}/${pkgname}"
  #python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
