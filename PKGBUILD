# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='beancount'
pkgdesc='Double-Entry Accounting from Text Files'
pkgver='2.0rc1'
pkgrel=1
arch=('i686' 'x86_64')
url="http://furius.ca/beancount/"
license=('GPL')
source=("https://pypi.python.org/packages/0d/a1/ead8cd1a81d160cc44b06511d0d0a3dd73fd0a734c0c37155fd50c3ea3b2/beancount-2.0rc1.tar.gz")
sha256sums=('8e87630982d2923969e673da785621a819364c32374f6350eaaa0d4c269b748b')
depends=('python>=3.5' 'mpdecimal' 'python-dateutil' 'python-ply'
         'python-bottle' 'python-lxml' 'python-magic-ahupp' 'python-beautifulsoup4'
         'python-chardet' 'python-google-api-python-client')
conflicts=('beancount-hg')

package () {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
