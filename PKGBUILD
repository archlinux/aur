# Contributor: Ismael Carnales <icarnales at gmail dot com>
pkgname=virtualenv-commands
pkgver=0.2.3
pkgrel=1
pkgdesc="Additional commands for virtualenv"
arch=('i686' 'x86_64')
url="http://thisismedium.com/labs/virtualenv-commands/"
license=('BSD')
depends=('python' 'setuptools')
source=(http://pypi.python.org/packages/source/v/virtualenv-commands/$pkgname-$pkgver.tar.gz)
md5sums=('4ee0d64d5e8992a9cac1abf3657abb49')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --prefix=/usr --root=$pkgdir/ || return 1
}
