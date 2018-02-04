# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python2-easyprocess
pkgver=0.2.3
pkgrel=1
pkgdesc="EasyProcess is an easy to use python subprocess interface."
arch=('any')
url="http://easyprocess.readthedocs.io/en/latest/"
license=('BSD')
depends=('python2>=2.6' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/E/EasyProcess/EasyProcess-${pkgver}.tar.gz")
md5sums=('d08c91cbb2cc4603297968e1ed9eac0f')

package() {
  cd "${srcdir}/EasyProcess-${pkgver}"
  install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
