# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2018
_pkgver_month=09
_pkgver_day=05

pkgname=retrosmart-qtcurve-theme
pkgver=1.0b
pkgrel=1
pkgdesc="Retrosmart theme for QtCurve."

url="https://github.com/mdomlop/$pkgname.git"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdomlop/$pkgname/archive/$pkgver.tar.gz")
md5sums=('eb12d5eaa4707ddb08ce3b40f2c9458e')

license=('GPL3')

optdepends=('qtcurve-qt4: Qt4'
            'qtcurve-qt5: Qt5'
            'qtcurve-kde: Qt5 (with KDE integration)'
            'qtcurve-gtk2: Gtk2'
            'xcursor-retrosmart: The corresponding X11 cursor theme'
            'retrosmart-aurorae-themes: The corresponding Aurorae themes'
            'retrosmart-kvantum-theme: The corresponding theme for Kvantum'
            'retrosmart-icon-theme: The corresponding icon theme'
            'retrosmart-xfwm4-themes: The corresponding themes for XFwm4'
            'retrosmart-openbox-themes: The corresponding themes for Openbox')

arch=('any')
group=('retrosmart')


build() {
    cd $srcdir/$pkgname-$pkgver
    make
    }

package() {
    cd $srcdir/$pkgname-$pkgver
    make install DESTDIR=$pkgdir
}
