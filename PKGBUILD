# Maintainer: Kyuunex <kyuunex at protonmail dot ch>
# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-monapo
pkgver=20170722
pkgrel=3
pkgdesc="A Japanese font for viewing Japanese ascii arts properly. Combined font that uses ipagp.ttf and mona.ttf."
arch=('any')
url="https://github.com/utuhiro78/modified-fonts"
license=('IPA')

_pkgsrc="monapo-$pkgver"
_pkgext="tar.xz"
source=("$url/raw/main/$_pkgsrc.$_pkgext")
sha256sums=('f1cf49006f9ef3079e95b2808c8727727aa664006502c9b52fa268bbe901d3cd')

package() {
  cd "$_pkgsrc"
  install -Dm644 monapo.ttf -t "$pkgdir/usr/share/fonts/TTF/"
}
