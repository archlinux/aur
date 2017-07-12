# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2017
_pkgver_month=07
_pkgver_day=12

pkgname=retrosmart-icon-theme
pkgver=0.2
pkgrel=1
pkgdesc="Retrosmart icon theme."
url="https://github.com/mdomlop/${pkgname}"
source=("https://github.com/mdomlop/retrosmart-icon-theme/archive/0.2.tar.gz")
md5sums=('47d3a4d706ea0be84154879fb3da38ef')
license=('GPL3')
optdepends=('retrosmart-gtk-themes: The corresponding GTK themes'
            'retrosmart-openbox-themes: The corresponding Openbox themes'
            'retrosmart-wallpapers: The corresponding backgrounds project'
            'retrosmart-x11-cursors: The corresponding X11 cursor theme'
            'retrosmart-xfwm4-themes: The corresponding XFwm4 themes')
arch=('any')
group=('retrosmart')


build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure
    make
    }

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install PREFIX=${pkgdir}/usr
}
