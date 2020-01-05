# Maintainer: Christian Karl <karlch at protonmail dot com>

pkgname=vimiv-qt
pkgrel=1
pkgver=0.5.0
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
sha256sums=('5246539830a657fdf907ec69b50ec7bc68d7f9f411c87a5edf160ed5804811a4')

package() {
    cd "$pkgname-$pkgver"
    make -f misc/Makefile DESTDIR="$pkgdir" install
}
