# Maintainer : cmach_socket <cmach_socket@outlook.com>
_reponame="org.kde.plasma.vutronmusic-lyrics"
pkgname=plasma6-applets-vutronmusic-lyrics
pkgver=25.12.21
pkgrel=1
arch=(any)
url="https://github.com/cmachsocket/$_reponame"
depends=(plasma-desktop kdeplasma-addons)
license=(GPL-3.0-or-later)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cafb3c60daac9b22410726ac375e78e9ec86228754e0a7462f560f6d7b0c3276')
package() {
  _path="$pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.vutronmusic-lyrics"
  mkdir -p "$_path"
  mkdir -p "$_path/contents"
  cp -r "$srcdir/$_reponame-$pkgver/contents"/* "$_path/contents"
  cp -r "$srcdir/$_reponame-$pkgver/metadata.json" "$_path/metadata.json"
  install -Dm 644 "$srcdir/$_reponame-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
