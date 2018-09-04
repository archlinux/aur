# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2018
_pkgver_month=01
_pkgver_day=09

pkgname=retrosmart-aurorae-themes
pkgver=1.0b
pkgrel=1
pkgdesc='A retrosmart look collection of themes for KDE Aurorae.'
url=https://github.com/mdomlop/retrosmart-aurorae-themes
source=("https://github.com/mdomlop/$pkgname/archive/$pkgver.tar.gz")
md5sums=('17b7636af957356eb2936f62d422a20e')
license=('GPL3')
optdepends=('retrosmart-kvantum-theme: The corresponding theme for Kvantum'
            'retrosmart-qtcurve-theme: The corresponding theme for QtCurve'
            'retrosmart-gtk-themes: The corresponding GTK themes'
            'retrosmart-openbox-themes: The corresponding Openbox themes'
            'retrosmart-wallpapers: The corresponding backgrounds project'
            'retrosmart-x11-cursors: The corresponding X11 cursor theme'
            'retrosmart-xfwm4-themes: The corresponding XFwm4 themes')
arch=('any')
group=('retrosmart')
changelog=ChangeLog


build() {
    cd $srcdir/$pkgname-$pkgver
    make
    }

package() {
    cd $srcdir/$pkgname-$pkgver
    make install DESTDIR=$pkgdir
}
