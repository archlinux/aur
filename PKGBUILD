# Maintainer: D3SOX <d3sox at protonmail dot com>

_reponame="plasmusic-toolbar"
pkgname=plasma6-applets-plasmusic-toolbar
pkgver=4.0.0
pkgrel=1
pkgdesc="Widget that shows currently playing song information and provide playback controls."
arch=(any)
url="https://github.com/ccatterina/$_reponame"
license=(GPL-3.0-or-later)
depends=(plasma-desktop kdeplasma-addons)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23a852dacb5c986d1222e6bd8263adbf1afee8df92139d6a5d44a1c81ea4ae0f')

package() {
  _path="$pkgdir/usr/share/plasma/plasmoids/plasmusic-toolbar" 
  mkdir -p "$_path"
  cp -r "$srcdir/$_reponame-$pkgver/src"/* "$_path"
  install -Dm 644 "$srcdir/$_reponame-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

