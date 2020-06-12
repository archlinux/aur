pkgname=python2-beautifulsoup3
pkgver=3.2.2
pkgrel=1
pkgdesc="A Python HTML/XML parser designed for quick turnaround projects like screen-scraping"
arch=('any')
url="http://www.crummy.com/software/BeautifulSoup/index.html"
license=('PSF')
depends=('python2')
makedepends=('python2-setuptools')
source=(http://www.crummy.com/software/BeautifulSoup/download/3.x/BeautifulSoup-${pkgver}.tar.gz)
sha1sums=('abf6b21002fb1c74aa786703cd0f8a19ab5b78ee')

package() {
  cd "${srcdir}/BeautifulSoup-${pkgver}"
  python2 setup.py install --root="${pkgdir}" -O1
}
