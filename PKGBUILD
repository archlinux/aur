# Maintainer: Kyuunex <kyuunex at protonmail dot ch>
# Contributor: orumin <dev at orum.in>

_fontname="koruri"
pkgname="ttf-$_fontname"
pkgver=20210720
pkgrel=3
pkgdesc="Japanese TrueType font obtained by mixing M+ and Open Sans"
arch=('any')
url="https://github.com/Koruri/Koruri"
license=('Apache-2.0')

_pkgsrc="Koruri-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext")

sha256sums=('f6cb55533a1f6b4a733152edc4153840151304e0fc4c232e586d4ec38e18cea1')

package() {
    install -Dm644 "$_pkgsrc"/*.ttf -t "$pkgdir/usr/share/fonts/$_fontname/"
}
