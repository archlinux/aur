# Maintainer: bigpod9 <bigpod9@gmail.com>
pkgname=dupliseek
pkgver=0.0.2
pkgrel=4
pkgdesc="Application to find all your duplicate images."
arch=('any')
url="https://gitlab.com/magnusmj/dupliseek.git"
license=('MIT')

depends=('python-pyqt5' 'python-numpy' 'python-imutils')

install=dupliseek.install
source=(dupliseek.0.0.2.tar.xz::https://gitlab.com/magnusmj/dupliseek/uploads/7a6999dd09ba87984e176c893344db9a/dupliseek.0.0.2.tar.xz)
md5sums=('feaeff56c2ccd5827e2e7efd2315a66b')


package() {
    cd "$srcdir"

	cp -r dupliseek/* "$pkgdir"/
}
