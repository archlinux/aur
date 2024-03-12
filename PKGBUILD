# Maintainer: D3SOX <d3sox at protonmail dot com>

_reponame="plasma-applet-alphablackcontrol"
pkgname=plasma6-applets-breeze-alphablack
pkgver=0.1
pkgrel=1
pkgdesc="An applet to control the Breeze - AlphaBlack theme by Zren."
arch=(any)
url="https://github.com/dhruv8sh/$_reponame"
license=(custom)
depends=(plasma-desktop plasma-addons breeze plasma5support)
source=("$pkgname::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('22c7b3eef13583dd834b7ef362493236d95f4a35fc962596f733364826c10d84')

package() {
  _path="$pkgdir/usr/share/plasma/plasmoids/com.github.zren.alphablackcontrol" 
  mkdir -p "$_path"
  cp -r "$srcdir/$_reponame-$pkgver"/* "$_path"
}

