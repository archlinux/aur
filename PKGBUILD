# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('7482 31EB CBD8 08A1 4F5E  85D2 8C00 4C2F 9348 1F6B')
# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=python2-dpkt
_pkgname=dpkt
pkgver=1.8.6.2
pkgrel=3
pkgdesc="This is a Python library for interacting with and creating packets."
arch=('i686' 'x86_64')
url="https://github.com/kbandla/dpkt"
license=('custom')
depends=('python2')
source=("https://pypi.python.org/packages/source/d/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('42d9113472904aa9b68efb94cf180dbd578b1fd36ffc5a085cfd393893230c47b505758120a800888abdd391bc6c598a3932712547219860b7abba1c5fc56c87')

package() {
  cd "${srcdir}/dpkt-${pkgver}"
  python2 setup.py build install --root="${pkgdir}"
}

