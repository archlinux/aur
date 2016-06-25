# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=python2-dpkt
_pkgname=dpkt
pkgver=1.8.6.2
pkgrel=4
pkgdesc="This is a Python library for interacting with and creating packets."
arch=('any')
url="https://github.com/kbandla/dpkt"
license=('custom')
depends=('python2')
source=("https://pypi.python.org/packages/source/d/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
	"${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('42d9113472904aa9b68efb94cf180dbd578b1fd36ffc5a085cfd393893230c47b505758120a800888abdd391bc6c598a3932712547219860b7abba1c5fc56c87'
            'SKIP')

package() {
  cd "${srcdir}/dpkt-${pkgver}"
  python2 setup.py build install --root="${pkgdir}"
}

