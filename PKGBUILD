# Maintainer:  trashstar <trash@ps3zone.org>

pkgname=etmtk
pkgver=3.1.18
pkgrel=1
pkgdesc="Manage events and tasks using simple text files."
arch=('any')
url="http://people.duke.edu/~dgraham/etmtk/"
license=('GPL')
depends=('tk' 'python-dateutil' 'python-yaml')
optdepends=('python-icalendar: iCalendar support')
makedepends=('python-setuptools')
source=("http://people.duke.edu/~dgraham/etmtk/etmtk-$pkgver.tar.gz")
md5sums=(aaae25598e123ca23d00d2fa68590712)

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --prefix=/usr --root=$pkgdir
}


