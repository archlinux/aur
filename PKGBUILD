# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>
# Contributor: Philip Müller <philm@manjaro.org>
# Contributor: Alexandru Ianu <alexandru . ianu @ gmail . com>

pkgname=vertex-maia-icon-theme
_folder=vertex-maia-icon-themes
pkgver=20160526
pkgrel=2
pkgdesc="Icons matching Vertex Maia themes, based on Menda Circle (Mirrored onto AUR)"
_commit=31e46d7297a3bc729fbe4f40e75692fe764aed27
arch=('any')
url="https://gitlab.manjaro.org/artwork/icon-themes/vertex-maia-icon-themes"
license=('GPL')
depends=('hicolor-icon-theme' 'librsvg')
options=('!emptydirs' '!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.bz2::$url/-/archive/$pkgver/vertex-maia-icon-themes-$pkgver.tar.bz2")
b2sums=('4bae330134535f589641e21cc9f4570360cf97746de590b7098f4a2612890f492253d54e585b5946642e8ad3623c240a4dd39fd125e1824fba7fa3fb566fbd8e')

package() {
  install -dm755 "${pkgdir}/usr/share/icons"

  cd "$pkgdir/usr/share/icons"
  cp -r "$srcdir/$_folder-$pkgver/Vertex-Maia" Vertex-Maia
}
