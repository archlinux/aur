# Maintainer: Shimi Chen <shimi.chen@gmail.com>
# Contributor: jcerdan <jcerdan@tecob.com>
pkgname=pondus
pkgver=0.8.0
pkgrel=2
pkgdesc="personal weight management program written in Python and GTK2"
arch=('i686' 'x86_64')
url="http://www.ephys.de/software/pondus/"
license=('GPL')
depends=('python2' 'pygtk>=2.6' 'hicolor-icon-theme')
optdepends=('python2-matplotlib: graph support')
makedepends=('')
install='pondus.install'
source=(http://bitbucket.org/eike/pondus/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('1e95794ce69c516faf4e57b858ff0fe1')

package() {
	cd "$srcdir/$pkgname-$pkgver"
    python2 ./setup.py install --root=$pkgdir/
}
