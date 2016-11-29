# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='beancount'
pkgdesc='Double-Entry Accounting from Text Files'
pkgver='2.0b13'
pkgrel=1
arch=('i686' 'x86_64')
url="http://furius.ca/beancount/"
license=('GPL')
source=("https://pypi.python.org/packages/76/73/335733b436d66071aeaa9831c7411912c26ff039bb3cbfc1310f817641f7/beancount-2.0b13.tar.gz")
sha256sums=('75628f08b185da866cb24445635d472d76b84f2bb9411c5609a0f1850466f399')
depends=('python>=3.5' 'mpdecimal' 'python-dateutil' 'python-ply'
         'python-bottle' 'python-lxml' 'python-magic-ahupp' 'python-beautifulsoup4'
         'python-chardet' 'python-google-api-python-client')
conflicts=('beancount-hg')

package () {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
