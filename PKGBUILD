# Maintainer: Manuel Domínguez López
# <mdomlop at gmail dot com>
# @mdomlop at telegram

_pkgver_year=2020
_pkgver_month=10
_pkgver_day=23

pkgname=retrosmart-color-schemes
pkgver=0.1b
pkgrel=1
pkgdesc="Retrosmart KDE Plasma color schemes"
url="https://github.com/mdomlop/$pkgname"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdomlop/$pkgname/archive/$pkgver.tar.gz")
license=('GPL3')
optdepends=('xcursor-retrosmart: The corresponding Xcursor themes'
			'retrosmart-aurorae-themes: The corresponding Aurorae themes'
            'retrosmart-kvantum-theme: The corresponding theme for Kvantum'
            'retrosmart-qtcurve-theme: The corresponding theme for QtCurve'
            'retrosmart-icon-theme: The corresponding icon theme'
            'retrosmart-xfwm4-themes: The corresponding themes for XFwm4'
            'retrosmart-openbox-themes: The corresponding themes for Openbox')
arch=('any')
group=('retrosmart')
changelog=ChangeLog


package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR=$pkgdir
}
md5sums=('aeb8a93247e9bd0830be118473ee48a7')
