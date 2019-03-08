# Maintainer: Manuel Domínguez López
# <mdomlop at gmail dot com>
# @mdomlop at telegram

_pkgver_year=2019
_pkgver_month=03
_pkgver_day=08

pkgname=xcursor-retrosmart
name=retrosmart-x11-cursors
pkgver=1.1
pkgrel=1
pkgdesc="A retrosmart look collection of cursors for X."
url="https://github.com/mdomlop/$name"
source=("https://github.com/mdomlop/$name/archive/$pkgver.tar.gz")
license=('GPL3')
builddepends=('imagemagick' 'xorg-xcursorgen')
optdepends=('retrosmart-kvantum-theme: The corresponding theme for Kvantum'
            'retrosmart-qtcurve-theme: The corresponding theme for QtCurve'
            'retrosmart-openbox-themes: The corresponding Openbox themes'
            'retrosmart-xfwm4-themes: The corresponding XFwm4 themes')
arch=('any')
group=('retrosmart')
changelog=ChangeLog

build() {
    cd "${srcdir}/${name}-${pkgver}"
    make
    }

package() {
    cd "${srcdir}/${name}-${pkgver}"
    make install DESTDIR=$pkgdir
}
md5sums=('214db4ec299eaaf3855be8646ae2275f')
