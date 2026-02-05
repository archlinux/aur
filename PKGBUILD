# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Philip Müller <philm@manjaro.org>
# Contributor: Alexandru Ianu <alexandru . ianu @ gmail . com>

pkgname=vertex-maia-icon-theme
_folder=vertex-maia-icon-themes
pkgver=20180118
pkgrel=1
pkgdesc="Icons matching Vertex Maia themes, based on Menda Circle (Mirrored onto AUR)"
_commit=31e46d7297a3bc729fbe4f40e75692fe764aed27
arch=('any')
url="https://gitlab.manjaro.org/artwork/icon-themes/vertex-maia-icon-themes"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'librsvg')
options=('!emptydirs' '!strip')
source=("$pkgname-$pkgver.tar.bz2::$url/-/archive/$_commit/$_folder-$_commit.tar.bz2")
b2sums=('8e914cfd918b19a24aa20d2dd3ca4a72ea6853daf958a6df0fae972b69b679671b04c8e29ef83cc432a7121c63c9cdf774d61979f5d9a87dfd1681d6436b5b06')

package() {
  install -dm755 "${pkgdir}/usr/share/icons"

  cd "$pkgdir/usr/share/icons"
  cp -r "$srcdir/$_folder-$_commit/Vertex-Maia" Vertex-Maia
}
