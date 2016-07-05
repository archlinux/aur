# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='beancount'
pkgdesc='Double-Entry Accounting from Text Files'
pkgver='2.0b11'
pkgrel=2
arch=('i686' 'x86_64')
url="http://furius.ca/beancount/"
license=('GPL')
source=("https://pypi.python.org/packages/21/42/54a272e02d25ec0d336c9524ee6bd18bfa97ee5c284c0d75a8cbf2aeabfa/${pkgname}-${pkgver}.tar.gz")
sha256sums=('101f5a7f7474526d8f8268f9cbaf4647ba14664eceb375479340076d1675f574')
depends=('python>=3.5' 'mpdecimal' 'python-dateutil' 'python-ply'
         'python-bottle' 'python-lxml' 'python-magic-ahupp' 'python-beautifulsoup4'
         'python-chardet' 'python-google-api-python-client')
conflicts=('beancount-hg')

package () {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
