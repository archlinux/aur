# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-pype32
_pyname=pype32
pkgname=('python-pype32' 'python2-pype32')
makedepends=('python' 'python2')
_pkgver=0.1-alpha5
pkgver=0.1
pkgrel=2
pkgdesc="Yet another Python library to read and write PE/PE+ files."
arch=('any')
url="https://github.com/crackinglandia/pype32"
license=('BSD3')
source=("https://github.com/crackinglandia/pype32/archive/v${_pkver}.tar.gz")
sha512sums=('9cd85fc6bca27e11c48c06b64641d8a850dafd14f9912845180b027bf677608af2f5a5e77db87dd6ad7805f4af601666e5bbc6e1b72286244d6216839cca520e')

package_python-pype32() {
  depends=('python')
  cd "${srcdir}/${_pyname}-${_pkver}"
  python setup.py install -O1 --root=${pkgdir}
}

package_python2-pype32() {
  depends=('python2')
  cd "${srcdir}/${_pyname}-${_pkver}"
  python2 setup.py install -O1 --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
