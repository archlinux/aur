# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=feedagregator
pkgver=1.1.0
pkgrel=2
pkgdesc="RSS and Atom feed agregator in desktop widgets + notifications"
arch=('any')
url="https://github.com/j4321/FeedAgregator"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python' 'tk' 'gettext' 'desktop-file-utils' 'libnotify' 
         'python-beautifulsoup4' 'python-babel' 'python-feedparser'
         'tkhtml3-git')
optdepends=('tktray: GUI toolkit for the system tray icon (at least one must be installed)',
            'pygtk: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyqt5: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyqt4: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyside: GUI toolkit for the system tray icon (at least one must be installed)',
            'zenity: nicer color chooser',
            'python-tkcolorpicker: nicer color chooser')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j4321/FeedAgregator/archive/v${pkgver}.tar.gz")
sha512sums=('996b9ed532298255cdd9be52d6f8ad70029eb27c451cd7089546d77ffd349241ee1b015149a33a58c243cb43e655a3f3e963a62c3a10e063f0352888fe5dc0f5')

package() {
 cd "$srcdir/FeedAgregator-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
