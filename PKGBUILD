# Maintainer: MeoArch <https://github.com/QwQdoge>
_srcdir=meo-kde-3663bfdbc62c041727b9379ba5a34829a1763328
pkgname=meo-icons
pkgver=0.4.0
pkgrel=5
pkgdesc="Meo Symbols Material Design 3 icon theme"
arch=('any')
url='https://github.com/QwQdoge/meo-kde'
license=('Apache-2.0')
depends=('breeze-icons' 'hicolor-icon-theme')
source=('meo-kde-3663bfdbc62c041727b9379ba5a34829a1763328.tar.gz::https://codeload.github.com/QwQdoge/meo-kde/tar.gz/3663bfdbc62c041727b9379ba5a34829a1763328')
sha256sums=('c1e543ae72968283ce06c6eaf813f9d5db516bb840419bd99858523142c6a982')

package() {
  for theme in MeoSymbols MeoSymbolsDark; do
    install -d "$pkgdir/usr/share/icons/$theme"
    cp -a "$srcdir/$_srcdir/themes/icons/$theme/." "$pkgdir/usr/share/icons/$theme/"
  done
}
