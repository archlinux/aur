# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2018
_pkgver_month=01
_pkgver_day=09

pkgname=retrosmart-xfwm4-themes
pkgver=1.0
pkgrel=1
pkgdesc="Retrosmart themes for XFwm4"
url="https://github.com/mdomlop/$pkgname"
source=("https://github.com/mdomlop/$pkgname/archive/$pkgver.tar.gz")
license=('GPL3')
changelog=ChangeLog
optdepends=('xcursor-retrosmart: The corresponding X11 cursor theme')
arch=('any')
group=('retrosmart')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
    }

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR=$pkgdir
}
md5sums=('6992d85e9701ceef4665a4bb3147fccc')
