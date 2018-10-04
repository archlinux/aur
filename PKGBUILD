# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=ansible-review
pkgver=1.13.8
pkgrel=1
pkgdesc="Reviews Ansible playbooks, roles and inventory and suggests improvements."
url="https://github.com/willthames/ansible-review"
depends=('ansible-lint' 'python-yaml' 'python-appdirs' 'python-unidiff' 'flake8')
makedepends=('python2-nose')
license=('MIT')
arch=('any')
source=("https://github.com/willthames/ansible-review/archive/v${pkgver}.tar.gz")
sha256sums=('361d457b74543276fdcac6aff50dc0aac50013e39eb788cc9092483be37fd283')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
