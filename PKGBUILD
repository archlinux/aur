# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=mynotes
pkgver=2.3.3
pkgrel=1
pkgdesc="Desktop post-it / sticky notes managed from system tray icon"
arch=('any')
url="https://github.com/j4321/MyNotes"
license=('GPL3')
makedepends=('python-setuptools')
depends=('tk' 'python-ewmh' 'python-pillow' 'gettext' 'desktop-file-utils')
optdepends=('python-tkfilebrowser: nicer file browser',
            'zenity: nicer file browser',
            'tktray: GUI toolkit for the system tray icon (at least one must be installed)',
            'pygtk: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyqt5: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyqt4: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyside: GUI toolkit for the system tray icon (at least one must be installed)')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j4321/MyNotes/archive/v${pkgver}.tar.gz")
sha512sums=('243a10ee1d1485a94eb3f46fefc4de59b898786d127495f24dc734589de13aecc402de4a3e01609b760aa3439978e6759fa0ea10ee7c9fd31ef7ca80090b782b')

package() {
 cd "$srcdir/MyNotes-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
