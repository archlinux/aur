# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python2-pytest-mpl
pkgver=0.13
pkgrel=1
pkgdesc="Pytest plugin to help with testing figures output from Matplotlib"
arch=('i686' 'x86_64')
url="https://github.com/matplotlib/pytest-mpl"
license=('BSD')
depends=('python2>=2.7' 'python2-pytest' 'python2-matplotlib' 'python2-nose')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pytest-mpl/pytest-mpl-${pkgver}.tar.gz")
md5sums=('a7515d8ba2a275385c07eec3bd9193f3')

package() {
  cd ${srcdir}/pytest-mpl-${pkgver}

  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
