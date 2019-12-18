# Maintainer: Manuel Domínguez López
# <mdomlop at gmail dot com>
# @mdomlop at telegram

_pkgver_year=2019
_pkgver_month=12
_pkgver_day=18

pkgname=retrosmart-kdeplasma-welcomescreen
pkgver=1.0
pkgrel=1
pkgdesc='A retrosmart look welcome screen for KDE Plasma.'
url=https://github.com/mdomlop/$pkgname
source=("https://github.com/mdomlop/$pkgname/archive/$pkgver.tar.gz")
license=('GPL3')
optdepends=('xcursor-retrosmart: The corresponding X11 cursor theme'
            'retrosmart-aurorae-themes: The corresponding Aurorae themes'
            'retrosmart-icon-theme: The corresponding icon theme'
            'retrosmart-xfwm4-themes: The corresponding themes for XFwm4'
            'retrosmart-openbox-themes: The corresponding themes for Openbox')
arch=('any')
group=('retrosmart')
changelog=ChangeLog

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR=$pkgdir
}
md5sums=('1cd0e685b5cc73be643ae4ecdb71b063')
