# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=mynotes
pkgver=2.3.1
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
sha512sums=('d9e4d98e4910b29eeb68c6cb08bae977b083bbe32e5c22ab8b66dd6ce3e8053a0f06b4ea48934ffb2f9a405949f265b37487f942ab72fc86d9116145a2e0bbe0')

package() {
 cd "$srcdir/MyNotes-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
