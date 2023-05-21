# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=beancount
pkgdesc='Double-Entry Accounting from Text Files'
pkgver=2.3.5
pkgrel=3
arch=('i686' 'x86_64' 'armv7h')
url="http://furius.ca/beancount/"
license=('GPL')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('14e35625a2e9cbd43cae6178da08cb3f1224f6261e541ca6726df35d98e9c36a')
depends=('python>=3.6' 'mpdecimal' 'python-dateutil' 'python-ply'
         'python-bottle' 'python-lxml' 'python-magic' 'python-beautifulsoup4'
         'python-chardet' 'python-google-api-python-client' 'python-requests'
         'python-pytest')
makedepends=('python-setuptools')
conflicts=('beancount-hg')

package () {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
