# Maintainer: Simon Thorpe <simon@hivetechnology.com.au>
# Contributor: James Pearson <james.m.pearson+arch@gmail.com>

pkgname=python-easygui
pkgver=0.97.4
pkgrel=3
pkgdesc="A module for very simple, very easy GUI programming in Python"
url="http://easygui.sourceforge.net"
license=('CCPL')
arch=('any')
depends=('python' 'tk')
makedepends=('python-setuptools')
source=("http://sourceforge.net/projects/easygui/files/$pkgver/easygui-$pkgver.zip")
sha256sums=('6440b5bb6bc04cfb2d3dddbc4a7af7b913b35c1bbcb49805039a132361f2f8f5')

package() {
	cd $srcdir/easygui-$pkgver
	python setup.py install --root=$pkgdir
}