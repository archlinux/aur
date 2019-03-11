# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2018
_pkgver_month=11
_pkgver_day=17

pkgname=retrosmart-aurorae-themes
pkgver=1.1a
pkgrel=1
pkgdesc='A retrosmart look collection of themes for KDE Aurorae.'
url=https://github.com/mdomlop/$pkgname
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdomlop/$pkgname/archive/$pkgver.tar.gz")
md5sums=('3076e697e96b386385c8177530e8340e')
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
