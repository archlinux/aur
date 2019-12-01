# Maintainer: Christian Karl <karlch at protonmail dot com>

pkgname=vimiv-qt
pkgrel=1
pkgver=0.4.1
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
sha256sums=('f1c3adb928f81c163f628c492daa8f6f6a17dbaa8063e07d038b7d2fc47b09ed')

package() {
    cd "$pkgname-$pkgver"
    make -f misc/Makefile DESTDIR="$pkgdir" install
}
