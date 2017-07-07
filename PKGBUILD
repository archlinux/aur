# Maintainer: mdraw.gh@gmail.com

# This is currently based on Python 2 because of the hard dependency on
# unicodecsv. Once this is resolved, I will migrate it to Python 3.

pkgname=csvtotable
pkgver=1.1.0
pkgrel=0
pkgdesc='Simple command-line utility to convert CSV files to searchable and sortable HTML table'
url='https://github.com/vividvilla/csvtotable'
license=('MIT')
arch=('any')
depends=('python2' 'python2-click' 'python2-jinja'
         'python2-unicodecsv' 'python2-six')
makedepends=('python2-setuptools')
conflicts=('csvtotable-git')
source=("https://github.com/vividvilla/csvtotable/archive/${pkgver}.tar.gz")
sha256sums=('b3adbf058f6b9edc31e0e1fa99000bccbfbc65c3ebc53c53ed7ee7fb38bbabc8')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

