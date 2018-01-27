# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=mynotes
pkgver=2.3.0
pkgrel=1
pkgdesc="Desktop post-it / sticky notes managed from system tray icon"
arch=('any')
url="https://sourceforge.net/projects/my-notes"
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
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/my-notes/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('7b285f6107c9ebd9e539e1f6ce1b6ac385ac539e1399debaf96d18a29ab5f7d9d6ff91a2f98bd25f559b45286de0868c50232b8383c248a587f0d82aadaf94c0')

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
