pkgbase=python-ftputil
pkgname=('python2-ftputil' 'python-ftputil')
pkgver=3.2
pkgrel=1
pkgdesc="High-level FTP client library"
arch=('any')
url="http://ftputil.sschwarzer.net/"
license=('BSD 3-Clause')
source=(http://ftputil.sschwarzer.net/trac/attachment/wiki/Download/ftputil-$pkgver.tar.gz?format=raw)
sha1sums=('c29ae759d41af3a6558f6e5ecf76a402669275a2')

package_python-ftputil() {
   depends=('python')

   cd "${srcdir}/ftputil-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-ftputil() {
   depends=('python2')

   cd "${srcdir}/ftputil-${pkgver}"
   python2 setup.py install --root="${pkgdir}" --optimize=1
}
