# Maintainer: ShadowKyogre <shadowkyogre dot public at gmail dot com>

pkgname=slickpicker
pkgver=0.1
pkgrel=1
pkgdesc="A small PyQt color picker widget (can be run on its own)"
arch=('any')
url="https://github.com/ShadowKyogre/slickpicker/"
license=('GPL')
depends=('python'
    	 'pyqt')
source=("https://pypi.python.org/packages/source/s/slickpicker/slickpicker-$pkgver.tar.gz")

package() {
    cd "$srcdir/${pkgname}-$pkgver"
    python setup.py install --root="$pkgdir" 
}
md5sums=('9048863059dfd40d3f3997b95210c275')
