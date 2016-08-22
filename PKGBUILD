Maintainer='Gilles Hamel <hamelg@laposte.net>'
pkgname=weboob
pkgver=1.1
pkgrel=2
pkgdesc="Web Out Of Browsers provides several applications to interact with a lot of websites."
arch=('any')
url="http://weboob.org/"
license=('GPL')
depends=('phonon-qt4' 'python2-pyqt' 'python2-dateutil' 'python2-prettytable' 'python2-requests'
         'python2-elementtidy' 'python2-feedparser' 'python2-cssselect' 'python2-html2text'
         'python2-imaging' 'python2-pysqlite' 'python2-mechanize' 'python2-simplejson'
         'python2-lxml' 'python2-yaml' 'python2-gdata' 'python2-futures' 'which')
makedepends=('python2-distribute')
optdepends=('gnupg: check for repository authenticity'
            'python2-routes: contrib backends'
            'python2-webob: contrib backends'
            'python2-mako: contrib backends'
            'pywebkitgtk: contrib backends'
            'python2-pillow: PIL replacement'
            'python2-termcolor: color formatting'
            'python2-nose: test suite')
source=("http://symlink.me/attachments/download/324/$pkgname-$pkgver.tar.gz")
md5sums=('d0e0c8560c6f7eb79c309912ee1e2d13')

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --qt --xdg --prefix=/usr --root="$pkgdir"
}
