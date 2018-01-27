# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=feedagregator
pkgver=1.1.1
pkgrel=1
pkgdesc="RSS and Atom feed agregator in desktop widgets + notifications"
arch=('any')
url="https://github.com/j4321/FeedAgregator"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python' 'tk' 'gettext' 'desktop-file-utils' 'libnotify' 
         'python-beautifulsoup4' 'python-babel' 'python-feedparser'
         'python-pillow' 'tkhtml3-git')
optdepends=('tktray: GUI toolkit for the system tray icon (at least one must be installed)',
            'pygtk: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyqt5: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyqt4: GUI toolkit for the system tray icon (at least one must be installed)',
            'python-pyside: GUI toolkit for the system tray icon (at least one must be installed)',
            'zenity: nicer color chooser',
            'python-tkcolorpicker: nicer color chooser')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j4321/FeedAgregator/archive/v${pkgver}.tar.gz")
sha512sums=('b4b2903a575d0b9d0dee8f859d97512ede6367408d5267742d99efd74025e5544b285bfd2c7ba97e4d0718b548f2faa87935db367ad60839d1c2452fbedcd1af')

package() {
 cd "$srcdir/FeedAgregator-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
