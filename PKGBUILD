# Maintainer: Conrad Sachweh <conrad@spamthis.space>
pkgname=python-ansible-toolbox
pkgver=0.2
pkgrel=1
pkgdesc="Ansible helpers"
arch=('any')
url="https://github.com/larsks/ansible-toolbox"
license=('None')
depends=('python' 'python-jinja')
makedepends=('python-setuptools')
optdepends=('ansible')
options=(!emptydirs)
source=("https://pypi.python.org/packages/9f/7f/89b9f2a9eda7295254a048f01d3640af8c20e80a2f8c18e4ccfd1ffaf3e2/ansible-toolbox-$pkgver.tar.gz")
md5sums=('797ae59193746349d4717e252263952d')

package() {
  cd "$srcdir/ansible-toolbox-$pkgver"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
