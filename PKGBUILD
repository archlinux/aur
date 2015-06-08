# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

_plugin_name=default-fullzoom-level
pkgname=firefox-extension-$_plugin_name
pkgver=7.5
pkgrel=1
pkgdesc="Set Default FullZoom Level, Toolbar buttons for Page zoom and Text zoom."
arch=('any')
url="https://addons.mozilla.org/firefox/addon/default-fullzoom-level"
license=('MPL')
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/6965/default_fullzoom_level-7.5-fx.xpi")
sha256sums=('5e6af09ba1a8e9dcca14b57b77f3326ff717be6d55d99d933e73891538a23208')

package() {
  local emid={D9A7CBEC-DE1A-444f-A092-844461596C4D}
  local dstdir=$pkgdir/usr/lib/firefox/extensions/${emid}
  install -d $dstdir
  rm *.xpi
  cp -dpr --no-preserve=ownership * $dstdir
}
