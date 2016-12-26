# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

_pkgname=weboob
pkgname=weboob-headless
pkgver=1.1
pkgrel=1
pkgdesc="Web Out Of Browsers provides several applications to interact with a lot of websites. Headless version, for use in e.g. Cozy/Kresus."
arch=('any')
url="http://weboob.org/"
license=('GPL')
depends=('python2-dateutil'
         'python2-feedparser'
         'python2-lxml'
         'python2-prettytable'
         'python2-requests'
#         'python2-cssselect'
#         'python2-html2text'
         'python2-pillow'
         'python2-simplejson'
         'python2-yaml'
         'python2-mechanize'
         'python2-gdata'
         'python2-futures')
makedepends=('python2-setuptools')
conflicts=('weboob')
provides=('weboob')
source=("https://symlink.me/attachments/download/324/${_pkgname}-${pkgver}.tar.gz")
md5sums=('d0e0c8560c6f7eb79c309912ee1e2d13')
sha512sums=('bdc3024f5a9c7024a23cc21e9229aa7571178d3ada794cd5056b6323fcb3e91271491b8c3da43a1c87b9f8a686037a6c0b51421181cb2ff86558294a102a9191')

package() {
    cd ${_pkgname}-${pkgver}
    python2 setup.py install --no-qt --no-xdg --prefix=/usr --root="${pkgdir}"
}
