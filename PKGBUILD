pkgname=eric4-i18n-it
pkgver=4.5.21
pkgrel=1
pkgdesc="Italian translation for the Eric4 IDE"
arch=('any')
url="http://eric-ide.python-projects.org/index.html"
license=('GPL')
depends=('eric4')
source=(http://downloads.sourceforge.net/eric-ide/$pkgname-$pkgver.tar.gz)


package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/lib/python2.7/site-packages/eric4/i18n
  install -m644 ${srcdir}/eric4-$pkgver/eric/i18n/* \
    ${pkgdir}/usr/lib/python2.7/site-packages/eric4/i18n
}

md5sums=('f7d616c86c1781745d62bb2445363569')
