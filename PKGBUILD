# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
_pyname=pype32
pkgname='python2-pype32'
makedepends=('python2')
_pkgver="0.1-alpha5"
pkgver=0.1
pkgrel=4
pkgdesc="Yet another Python library to read and write PE/PE+ files."
arch=('any')
url="https://github.com/crackinglandia/pype32"
license=('BSD3')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/crackinglandia/pype32/archive/v${_pkgver}.tar.gz")
sha512sums=('9cd85fc6bca27e11c48c06b64641d8a850dafd14f9912845180b027bf677608af2f5a5e77db87dd6ad7805f4af601666e5bbc6e1b72286244d6216839cca520e')

package_python2-pype32() {
  depends=('python2')
  cd "${srcdir}/${_pyname}-${_pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
  mv "${pkgdir}/usr/bin/readpe"{.py,} 
}

# vim:set ts=2 sw=2 et:
