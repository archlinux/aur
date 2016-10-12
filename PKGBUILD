# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: Ivan Petruk <localizator@ukr.net>
pkgname=super-flat-remix-icon-theme
_pkgname=Flat-Remix
pkgver=1.09
pkgrel=2
pkgdesc='a pretty simple icon theme, derived from Ultra-Flat-Icons, Paper and Flattr'
arch=('any')
url='http://gnome-look.org/content/show.php/Super+flat+remix+icon+theme?content=169073'
license=('custom:cc-by-nc-sa-3.0')
depends=('xdg-utils')
options=(!strip !emptydirs)
source=("https://github.com/daniruiz/$_pkgname/archive/master.zip")
sha512sums=('543290b676f2e4e6a168b4edae3d563153de5f3f37e52f0b2d7f2bec58d5d22601d24d1aae7c406c67eb52ac48d89de978604b78cab38fc2c02f1f0de3ff4dc1')

package() {
    cd "${srcdir}/$_pkgname-master/"
    install -dm755 "${pkgdir}/usr/share/icons"
    #ls "Flat-Remix"
    rm -f "Flat Remix"/{CREDITS,LICENSE.txt}
    cp -a "Flat Remix" "${pkgdir}/usr/share/icons/$_pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
