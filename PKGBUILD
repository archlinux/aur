# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=ansible-review
pkgver=0.13.6
pkgrel=2
pkgdesc="Reviews Ansible playbooks, roles and inventory and suggests improvements."
url="https://github.com/willthames/ansible-review"
depends=('ansible-lint' 'python-yaml' 'python-appdirs' 'python-unidiff' 'flake8')
makedepends=('python2-nose')
license=('MIT')
arch=('any')
source=("https://github.com/willthames/ansible-review/archive/v${pkgver}.tar.gz")
sha256sums=('74ec3039ab1b8320284dfdd824234b7fb9045c8160eb9d726adf4077c3cbe2fe')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
