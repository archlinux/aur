# Maintainer: Simon Thorpe <simon@hivetechnology.com.au>
# Contributor: James Pearson <james.m.pearson+arch@gmail.com>

pkgname=python-easygui
pkgver=0.98.0
pkgrel=1
pkgdesc="A module for very simple, very easy GUI programming in Python"
url="http://easygui.sourceforge.net"
license=('CCPL')
arch=('any')
depends=('python' 'tk')
makedepends=('python-setuptools')
source=("https://github.com/robertlugg/easygui/archive/$pkgver.zip")
sha256sums=('06b03db1898a636dce3d23c70f1187f1c07b7b350b846ba3ee8a57bb601a8ed9')

package() {
	cd $srcdir/easygui-$pkgver
	python setup.py install --root=$pkgdir
}
