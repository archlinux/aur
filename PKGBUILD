# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=python2-dpkt
_pkgname=dpkt
pkgver=1.9.1
pkgrel=4
pkgdesc="This is a Python library for interacting with and creating packets."
arch=('any')
url="https://github.com/kbandla/dpkt"
license=('custom')
depends=('python2')
makedepends=('python2' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/d/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
	"${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('fc18907e4420249c5e8da21f630a24af6bee3e96545a58866170811c15802591a3bd6f7cf816ccb65e3437c0f451a1dc321fc46ac8a63cb8e8a06e0021e15f7f'
            'SKIP')

package() {
  cd "${srcdir}/dpkt-${pkgver}"
  python2 setup.py build install --root="${pkgdir}"
}

