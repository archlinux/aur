# Maintainer: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>
# Contributor: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>

pkgname='python-gitpython-211'
pkgver=2.1.1
pkgrel=0
pkgdesc="GitPython is a python library used to interact with Git repositories"
url="https://github.com/gitpython-developers/GitPython"
arch=('any')
license=('BSD-3')
depends=('python')
provides=('python-gitpython' 'python-gitpython=2.1.1')
source=("https://files.pythonhosted.org/packages/21/13/8d0981cee1c5b9dd7fa9f836ed7c304891686f300572c03a49e52c07c04c/GitPython-${pkgver}.tar.gz")
sha512sums=('b9f49e0c23501926647c41dd386865d0bc79eae9bb4789b12a6d5ef74d57121f4953aef55a46d324d1be9d6d01f8f087f86bdf353137ac2e3027c81da81f1fb1')

package() {
  cd "${srcdir}/GitPython-${pkgver}"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
