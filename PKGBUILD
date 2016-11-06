# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
_pyname=virustotal-api
pkgname=('python2-virustotal-api')
makedepends=('python2' 'python2-setuptools')
pkgver=1.1.2
pkgrel=1
pkgdesc="Virus Total Public/Private/Intel API"
arch=('any')
url="https://pypi.python.org/pypi/virustotal-api#downloads"
license=('MIT')
source=("https://pypi.python.org/packages/source/v/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha512sums=('ed687b1b75532d23489bc9a9dffc99e60ee041fd3e87740e5738c0c274af31fad92e8de06560961f15e3a617cb896d0a2749c4f125ff5257c19e01595f1f3d0e')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install -O1 --root=${pkgdir}
}

# vim:set et sw=2 ts=2 tw=79:
