# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=python-gsmmodem
pkgver=0.9
pkgrel=1
pkgdesc="python-gsmmodem is a module that allows easy control of a GSM modem attached to the system"
url="https://github.com/faucamp/python-gsmmodem"
license=("GPL3")
arch=("any")
source=("https://github.com/faucamp/python-gsmmodem/archive/0.9.tar.gz")
depends=("python")
sha256sums=("0ea023791866c0bf35a29686633b97d48e1e7674d0695a69606efb55afe5dd33")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
  rm -Rf "${pkgdir}/usr/bin"	
}
