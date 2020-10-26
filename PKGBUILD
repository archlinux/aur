# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-bash
pkgver=0.4.2
pkgrel=1
pkgdesc="An extension for colcon-core to provide Bash scripts."
arch=(any)
url="https://pypi.org/project/colcon-bash"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/c3/7c/7ab5345c9aa64d91bdc09e69bc3f90678eb08a0ba8c512ca1972927d8ee6/colcon-bash-0.4.2.tar.gz)
sha256sums=(86950ca62293b655ef8d655d2994d110321fff2fc6739c46a64f005a0cee1bdd)

package() {
    cd ${srcdir}/colcon-bash-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
