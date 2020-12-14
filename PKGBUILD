# Maintainer: Manuel Domínguez López
# <mdomlop at gmail dot com>
# @mdomlop at telegram

_pkgver_year=2020
_pkgver_month=10
_pkgver_day=23

pkgname=xcursor-retrosmart
_pkgname=retrosmart-x11-cursors
pkgver=2.3.1
pkgrel=1
pkgdesc="A retrosmart look collection of cursors for X."
url="https://github.com/mdomlop/$_pkgname"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdomlop/$_pkgname/archive/$pkgver.tar.gz")
license=('GPL3')
makedepends=('imagemagick' 'xorg-xcursorgen')
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
md5sums=('c370f71323077bd74ad7e14f4dcc20ee')
