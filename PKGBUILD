# Maintainer: Christian Karl <karlch at protonmail dot com>

pkgname=vimiv-qt
pkgrel=1
pkgver=0.4.0
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
sha256sums=('b91e1c2e2fa0fc16eb1bddc7bc6920275c913b7f7445ba8237d6297eeb5a7f25')

package() {
    cd "$pkgname-$pkgver"
    make -f misc/Makefile DESTDIR="$pkgdir" install
}
