# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
pkgbase=python-ftputil
pkgname=('python-ftputil' 'python2-ftputil')
pkgver=3.4
pkgrel=1
pkgdesc="High-level FTP client library"
arch=('any')
url="http://ftputil.sschwarzer.net/"
license=('BSD 3-Clause')
source=(http://ftputil.sschwarzer.net/trac/attachment/wiki/Download/ftputil-$pkgver.tar.gz?format=raw)
sha1sums=('0448f1323d66f62334a9b8814bdffe3f7a725289')

package_python-ftputil() {
   depends=('python')

   cd "${srcdir}/ftputil-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1
   mv ${pkgdir}/usr/doc/{ftputil,${pkgname}}
}

package_python2-ftputil() {
   depends=('python2')

   cd "${srcdir}/ftputil-${pkgver}"
   python2 setup.py install --root="${pkgdir}" --optimize=1
   mv ${pkgdir}/usr/doc/{ftputil,${pkgname}}
}
