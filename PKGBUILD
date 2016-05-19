# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: Ivan Petruk <localizator@ukr.net>
pkgname=super-flat-remix-icon-theme
_pkgname=Super-Flat-Remix
pkgver=1.09
pkgrel=1
pkgdesc='a pretty simple icon theme, derived from Ultra-Flat-Icons, Paper and Flattr'
arch=('any')
url='http://gnome-look.org/content/show.php/Super+flat+remix+icon+theme?content=169073'
license=('custom:cc-by-nc-sa-3.0')
depends=('xdg-utils')
options=(!strip !emptydirs)
source=("https://github.com/daniruiz/$_pkgname/archive/master.zip")

sha512sums=('1a3b315674b02df1e318a35106842d88674954053a0a311f203969111dc2fe321eae14f831991ac69b2e6f0d9b16e43269b10f8e9e264185aef2dab5394bb2c0')

package() {
    cd "${srcdir}/$_pkgname-master/"
    install -dm755 "${pkgdir}/usr/share/icons"
    ls "Super Flat Remix"
    rm -f "Super Flat Remix"/{CREDITS,LICENSE.txt}
    cp -a "Super Flat Remix" "${pkgdir}/usr/share/icons/$_pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
sha512sums=('0609d7d221cd019b8d51e2edc8535b77db123f17b2e06861ed529f874e142e1d50942dd47bf08dcf87455184136c2cf5e9e328862c9d40dcce9b24448ab43048')
