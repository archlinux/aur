# Maintainer: D3SOX <d3sox at protonmail dot com>

_reponame="plasmusic-toolbar"
pkgname=plasma6-applets-plasmusic-toolbar
pkgver=2.2.0
pkgrel=1
pkgdesc="Widget that shows currently playing song information and provide playback controls."
arch=(any)
url="https://github.com/ccatterina/$_reponame"
license=(GPL3)
depends=(plasma-desktop kdeplasma-addons)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f9d1122c0382a459f7d69786595aa67f1df8db199373b423912784b5a43dad07')

package() {
  _path="$pkgdir/usr/share/plasma/plasmoids/plasmusic-toolbar" 
  mkdir -p "$_path"
  cp -r "$srcdir/$_reponame-$pkgver/src"/* "$_path"
  install -Dm 644 "$srcdir/$_reponame-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

