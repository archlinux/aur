# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='ansible-lint-junit'
pkgname=('python-ansible-lint-junit' 'python2-ansible-lint-junit')
pkgver='0.11'
pkgrel='1'
pkgdesc='ansible-lint to JUnit converter'
arch=('any')
url="https://github.com/wasilak/${pkgbase}"
makedepends=('python' 'python-setuptools'
	     'python2' 'python2-setuptools')
license=('BSD')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('5781e47dfc5ea26769d13316bde7f0ae4f242bdaaf84673cf85391265586ff63')

package_python-ansible-lint-junit() {
  depends=('ansible-lint')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-ansible-lint-junit() {
  depends=('ansible-lint')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
}
