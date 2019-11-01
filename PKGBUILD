# Maintainer: Christian Karl <karlch at protonmail dot com>

pkgname=vimiv-qt
pkgrel=1
pkgver=0.3.0
pkgdesc='An image viewer with vim-like keybindings'
arch=('any')
url='https://github.com/karlch/vimiv-qt'
license=('GPL3')
depends=('python-pyqt5')
makedepends=('git' 'python-setuptools')
optdepends=('qt5-svg: for svg support' 'python-piexif: for exif support')
conflicts=('vimiv' 'vimiv-git' 'vimiv-qt-git')
provides=('vimiv')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c14e5a96ecb97b0c3b6961589c2d509dc0785539c13636dea6674146a1e8af75')

package() {
    cd "$pkgname-$pkgver"
    make -f misc/Makefile DESTDIR="$pkgdir" install
}
