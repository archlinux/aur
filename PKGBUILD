# Contributor: İlker Kesen <ikesen92@gmail.com>
pkgname=django-taggit
pkgver=0.9.1
pkgrel=1
pkgdesc="Simple tagging application for Django"
arch=('i686' 'x86_64')
url="http://github.com/alex/django-taggit/"
license=('BSD')
depends=('python2' 'django')
source=(http://pypi.python.org/packages/source/d/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1ddca9dd55fb629a0cc03c4b0481a1ea')

build() { 
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir || return 1
}
