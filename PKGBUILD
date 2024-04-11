# Maintainer: Kyuunex <kyuunex at protonmail dot ch>

_fontname="ohruri"
pkgname="ttf-$_fontname"
pkgver=20221103
pkgrel=3
pkgdesc="Japanese TrueType font obtained by mixing M+ FONTS, Source Han Sans, and Open Sans."
arch=('any')
url="https://github.com/Koruri/Ohruri"
license=('OFL-1.1')

_pkgsrc="Ohruri-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext")

sha256sums=('3151949ea431012447f247690e2722362ef059f797e83a167a8b0223f8b54aa3')

package() {
    install -Dm644 "$_pkgsrc"/*.ttf -t "$pkgdir/usr/share/fonts/$_fontname/"
}
