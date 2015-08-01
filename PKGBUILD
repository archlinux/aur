# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
pkgname=super-flat-remix-icon-theme
_pkgname=Super-Flat-Remix
pkgver=1.06
pkgrel=1
pkgdesc='a pretty simple icon theme, derived from Ultra-Flat-Icons, Paper and Flattr'
arch=('any')
url='http://gnome-look.org/content/show.php/Super+flat+remix+icon+theme?content=169073'
license=('custom:cc-by-nc-sa-3.0')
depends=('xdg-utils')
options=(!strip !emptydirs)
install=${pkgname}.install
source=(
    "https://github.com/daniruiz/$_pkgname/archive/master.zip"
	"${pkgname}.install"
)
sha512sums=('56c01ca3ce38b88fb9980f4c94bebee0704e66a831e050de4dffa920d14d90c13ff9532e10b9fd530b9510a5b388b958b9463f8ddae4b8c149e81692240e9a8a'
            '2e4eb809c4c58093f0d888d1cf632241128f6c8b19bed1c6b3e579e1cbfce66f5f179b6195c39fee49baa5824583f81ec97035d8db2daa91f98d220c06e44041')
package() {
    cd "${srcdir}/$_pkgname-master/"
    install -dm755 "${pkgdir}/usr/share/icons"
    ls "Super Flat Remix"
    rm -f "Super Flat Remix"/{CREDITS,LICENSE.txt}
    cp -a "Super Flat Remix" "${pkgdir}/usr/share/icons/$_pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
