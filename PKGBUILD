# Maintainer: Manuel Domínguez López
# <mdomlop at gmail dot com>
# @mdomlop at telegram

_pkgver_year=2019
_pkgver_month=07
_pkgver_day=13

pkgname=xcursor-retrosmart
_pkgname=retrosmart-x11-cursors
pkgver=2.0
pkgrel=1
pkgdesc="A retrosmart look collection of cursors for X."
url="https://github.com/mdomlop/$_pkgname"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdomlop/$_pkgname/archive/$pkgver.tar.gz")
license=('GPL3')
builddepends=('imagemagick' 'xorg-xcursorgen')
optdepends=('retrosmart-aurorae-themes: The corresponding Aurorae themes'
            'retrosmart-kvantum-theme: The corresponding theme for Kvantum'
            'retrosmart-qtcurve-theme: The corresponding theme for QtCurve'
            'retrosmart-icon-theme: The corresponding icon theme'
            'retrosmart-xfwm4-themes: The corresponding themes for XFwm4'
            'retrosmart-openbox-themes: The corresponding themes for Openbox')
arch=('any')
group=('retrosmart')
changelog=ChangeLog

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    make
    }

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make install DESTDIR=$pkgdir
}
md5sums=('db036e6c29ad6aa4e4b41f2472e4f1b4')
