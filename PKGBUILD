# Maintainer: Mark Weiman <mark.weiman@markzz.com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>
# Contributor: Wes Brown <wesbrown18@gmail.com>

pkgname=python-dpkt
_pkgname=dpkt
pkgver=1.9.2
pkgrel=1
pkgdesc="This is a Python library for interacting with and creating packets."
arch=('any')
url="https://github.com/kbandla/dpkt"
license=('custom')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/d/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('c5004c61ea19b4a76f278904d4f5efb447a2a0f292f7d917d7b0e11953ee09ae52226a19218f690b2958ef9eb4ac0676f8465ed41fd200b4c6ac01f1ffd8e28c')

package() {
  cd "${srcdir}/dpkt-${pkgver}"
  python setup.py build install --root="${pkgdir}"
}
