# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=mynotes
pkgver=2.3.2
pkgrel=1
pkgdesc="Desktop post-it / sticky notes managed from system tray icon"
arch=('any')
url="https://github.com/j4321/MyNotes"
license=('GPL3')
makedepends=('python-setuptools')
depends=('tktray' 'python-ewmh' 'python-pillow' 'gettext' 'desktop-file-utils')
optdepends=('python-tkfilebrowser: nicer file browser',
            'zenity: nicer file browser',
            'tktray: GUI toolkit for the system tray icon (at least one must be installed)',
            'pygtk: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyqt5: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyqt4: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyside: GUI toolkit for the system tray icon (at least one must be installed)')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j4321/MyNotes/archive/v${pkgver}.tar.gz")
sha512sums=('4236ba35056a9d3b3a3ad0754b25b378c368aad1d4701184bd84d675d6826713fed099cb7d6ead52a496edbaf463bd9137154a5c92422b935b2497b75db3d96a')

package() {
 cd "$srcdir/MyNotes-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
