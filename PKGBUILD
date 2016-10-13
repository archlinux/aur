# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: Ivan Petruk <localizator@ukr.net>
pkgname=super-flat-remix-icon-theme
_pkgname=Flat-Remix
pkgver=1.10
pkgrel=1
pkgdesc='a pretty simple icon theme, derived from Ultra-Flat-Icons, Paper and Flattr'
arch=('any')
url='http://gnome-look.org/content/show.php/Super+flat+remix+icon+theme?content=169073'
license=('custom:cc-by-nc-sa-3.0')
depends=('xdg-utils')
options=(!strip !emptydirs)
source=("https://github.com/daniruiz/$_pkgname/archive/master.zip")
sha512sums=('06f2842795964b9cacfed5c309db42a334cc4621363ff42231d10616f1d4081e09b6f2c0cfc64838116bc5d8dbdada41839eb6ced381db275a5305baa92d6efc')

package() {
    cd "${srcdir}/$_pkgname-master/"
    install -dm755 "${pkgdir}/usr/share/icons"
    rm -f "Flat Remix"/{CREDITS,LICENSE.txt}
    cp -a "Flat Remix" "${pkgdir}/usr/share/icons/$_pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

