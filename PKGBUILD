# Maintainer: Oleg Plakhotniuk <olegus8 at gmail>
# Contributor: Gerardo Marset <gammer1994@gmail.com>
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=python2-rabbyt
pkgver=0.8.3
pkgrel=1
pkgdesc="A sprite library for Python with game development in mind"
arch=('i686' 'x86_64')
url="http://arcticpaint.com/projects/rabbyt"
license=('LGPL')
depends=('python2' 'mesa' 'glu')
makedepends=('pyrex')
conflicts=('python-rabbyt-old')
source=("http://pypi.python.org/packages/source/R/Rabbyt/Rabbyt-$pkgver.zip")
md5sums=('bb603a5cb02f3a8bb2e674f60e62de2c')

build() {
    cd Rabbyt-$pkgver
    python2 setup.py build 
}

package() {
    cd Rabbyt-$pkgver
    python2 setup.py install --root "$pkgdir" 
}
