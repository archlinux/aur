# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Dave Blair <mail@dave-blair.de>

pkgname=autokey
pkgver=0.95.7
pkgrel=2
pkgdesc="AutoKey, a desktop automation utility for Linux and X11, updated to run on Python 3"
arch=('i686' 'x86_64')
url="https://github.com/autokey/autokey"
depends=('python' 'wmctrl' 'hicolor-icon-theme' 'python-dbus' 'python-pyinotify'
         'zenity' 'xautomation' 'imagemagick' 'xorg-xwd' 'python-xlib' 'python-setuptools'
         'python-six' 'python-gobject' 'gtksourceview3' 'libnotify'
         'libappindicator-gtk3' 'gtk-update-icon-cache')
optdepends=('kdialog: for Qt interface'
            'python-pyqt5: for Qt interface'
            'python-qscintilla-qt5: for Qt interface'
            'qt-at-spi: to work with KDE/Qt applications'
            'python-atspi: for ATSPI in Gtk interface')
replaces=('autokey-py3')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/autokey-py3/autokey/archive/v${pkgver}.tar.gz")
sha256sums=('b126fe4db8327e9575bd689d57c5e09236f3c08e9ac571b7cc257baf6c3a9d68')

package() {
    cd "$srcdir/autokey-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
