# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='beancount'
pkgdesc='Double-Entry Accounting from Text Files'
pkgver='2.0b15'
pkgrel=1
arch=('i686' 'x86_64')
url="http://furius.ca/beancount/"
license=('GPL')
source=("https://pypi.python.org/packages/03/e8/d03ce245347ab88daf277dc2ebe548cc0e5f9d470482f364bdb9e9f31d11/beancount-2.0b15.tar.gz")
sha256sums=('d3a00ff4875f1b24b73f297c92531e1fac48b792ad6af7d42f936ca2e4bb76b7')
depends=('python>=3.5' 'mpdecimal' 'python-dateutil' 'python-ply'
         'python-bottle' 'python-lxml' 'python-magic-ahupp' 'python-beautifulsoup4'
         'python-chardet' 'python-google-api-python-client')
conflicts=('beancount-hg')

package () {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
