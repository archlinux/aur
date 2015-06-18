# Maintainer:  trashstar <trash@ps3zone.org>

pkgname=etmtk
pkgver=3.1.14
pkgrel=1
pkgdesc="Manage events and tasks using simple text files."
arch=('any')
url="http://people.duke.edu/~dgraham/etmtk/"
license=('GPL')
depends=('tk' 'python-dateutil' 'python-yaml')
optdepends=('python-icalendar: iCalendar support')
makedepends=('python-setuptools')
source=("http://people.duke.edu/~dgraham/etmtk/etmtk-$pkgver.tar.gz")
md5sums=(48e3173e09c366bce3555490e05c2780)

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --prefix=/usr --root=$pkgdir
}


