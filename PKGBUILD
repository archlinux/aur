# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
# Previous maintainer: mdraw.gh@gmail.com

# This is currently based on Python 2 because of the hard dependency on
# unicodecsv. Once this is resolved, I will migrate it to Python 3.

pkgname=csvtotable
pkgver=2.1.1
pkgrel=1
pkgdesc='Simple command-line utility to convert CSV files to searchable and sortable HTML table'
url='https://github.com/vividvilla/csvtotable'
license=('MIT')
arch=('any')
depends=('python2' 'python2-click' 'python2-jinja'
         'python2-unicodecsv' 'python2-six')
makedepends=('python2-setuptools')
conflicts=('csvtotable-git')
source=("https://github.com/vividvilla/csvtotable/archive/${pkgver}.tar.gz")
sha256sums=('ba58055a22c657e1e2db987d93e915567b26daa0e6a9a061a827233c445c6cfc')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

