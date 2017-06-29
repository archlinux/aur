# $Id: PKGBUILD 114580 2014-07-02 06:23:17Z fyan $ 
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>

pkgname=python2-beautifulsoup3
pkgver=3.2.1
pkgrel=3
pkgdesc="A Python HTML/XML parser designed for quick turnaround projects like screen-scraping"
arch=('any')
url="http://www.crummy.com/software/BeautifulSoup/index.html"
license=('PSF')
depends=('python2')
provides=('python-beautifulsoup=3.2.1')
conflicts=('python-beautifulsoup')
replaces=('python-beautifulsoup')
source=(http://www.crummy.com/software/BeautifulSoup/download/3.x/BeautifulSoup-${pkgver}.tar.gz)
sha1sums=('b23e78f058240eb8779dbc1b8a8d76bba4916df1')

package() {
  cd "${srcdir}/BeautifulSoup-${pkgver}"

  python2 setup.py install --root="${pkgdir}" -O1
}
