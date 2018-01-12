# Maintainer: Conrad Sachweh <conrad+aur@spamthis.space>
pkgname=python-ansible-toolbox
_pkgname=ansible-toolbox
pkgver=0.3
pkgrel=1
pkgdesc="Ansible helpers"
arch=('any')
url="https://github.com/larsks/ansible-toolbox"
license=('None')
depends=('python' 'python-jinja')
makedepends=('python-setuptools')
optdepends=('ansible')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('3e75d5b4f56b8db526503d2387e48579')

package() {
  cd "$srcdir/ansible-toolbox-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
