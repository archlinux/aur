# Maintainer: D3SOX <d3sox at protonmail dot com>

_reponame="plasmusic-toolbar"
pkgname=plasma6-applets-plasmusic-toolbar
pkgver=2.6.0
pkgrel=1
pkgdesc="Widget that shows currently playing song information and provide playback controls."
arch=(any)
url="https://github.com/ccatterina/$_reponame"
license=(GPL-3.0-or-later)
depends=(plasma-desktop kdeplasma-addons)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('97a209c59bd86d9e385693d6cb7a69bf33839112606a5e4534e2c39eb7f08e6f')

package() {
  _path="$pkgdir/usr/share/plasma/plasmoids/plasmusic-toolbar" 
  mkdir -p "$_path"
  cp -r "$srcdir/$_reponame-$pkgver/src"/* "$_path"
  install -Dm 644 "$srcdir/$_reponame-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

