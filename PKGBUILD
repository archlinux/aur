# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2019
_pkgver_month=10
_pkgver_day=24

pkgname=retrosmart-aurorae-themes
pkgver=1.5
pkgrel=1
pkgdesc='A retrosmart look collection of themes for KDE Aurorae.'
url=https://github.com/mdomlop/$pkgname
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdomlop/$pkgname/archive/$pkgver.tar.gz")
license=('GPL3')
optdepends=('xcursor-retrosmart: The corresponding X11 cursor theme'
            'retrosmart-icon-theme: The corresponding icon theme'
            'retrosmart-kvantum-theme: The corresponding theme for Kvantum'
            'retrosmart-qtcurve-theme: The corresponding theme for QtCurve')
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
md5sums=('0a97c92ac89b6eb69a326294b47ed37f')
