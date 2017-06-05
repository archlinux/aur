# Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
pkgname=python-nanomsg
pkgver=1.0
pkgrel=1
pkgdesc="Python library for nanomsg"
arch=('any')
url="https://pypi.python.org/pypi/nanomsg"
license=('MIT')
depends=('nanomsg')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/0b/b1/3037e0e380d5fab2824e69a59bd374da402c0cef264ccb3fe5d71c230c4b/nanomsg-1.0.tar.gz")
noextract=()
md5sums=('102bb729d07c1ecbc90bccff07a31be2')

package() {
	cd $srcdir/nanomsg-1.0
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
