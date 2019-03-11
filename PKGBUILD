# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2018
_pkgver_month=09
_pkgver_day=05

pkgname=retrosmart-kvantum-theme
pkgver=1.0b
pkgrel=1
pkgdesc="Retrosmart theme for Kvantum"

url="https://github.com/mdomlop/$pkgname.git"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdomlop/$pkgname/archive/$pkgver.tar.gz")
md5sums=('5324149eac10878fc254b90d548f9d2f')

license=('GPL3')

depends=('kvantum-qt5')
optdepends=('xcursor-retrosmart: The corresponding X11 cursor theme'
            'retrosmart-aurorae-themes: The corresponding Aurorae themes'
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
