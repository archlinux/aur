pkgbase=python-ftputil
pkgname=('python-ftputil' 'python2-ftputil')
pkgver=3.2
pkgrel=2
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
   install -D -m755 "${pkgdir}/usr/doc/ftputil" "${pkgdir}/usr/share/doc/python-ftputil"
}

package_python2-ftputil() {
   depends=('python2')

   cd "${srcdir}/ftputil-${pkgver}"
   python2 setup.py install --root="${pkgdir}" --optimize=1
   install -D -m755 "${pkgdir}/usr/doc/ftputil" "${pkgdir}/usr/share/doc/python2-ftputil"
}
