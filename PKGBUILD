# Maintainer : cmach_socket <cmach_socket@outlook.com>
_reponame="org.kde.plasma.vutronmusic-lyrics"
pkgname=plasma6-applets-vutronmusic-lyrics
pkgver=26.8.19
pkgrel=1
arch=(any)
url="https://github.com/cmachsocket/$_reponame"
depends=(plasma-desktop kdeplasma-addons)
license=(GPL-3.0-or-later)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6cb9559495395d4a7ebd1ec943559098cd49ed5c8fb68de4e90ecbf00d39ecc6')
package() {
  _path="$pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.vutronmusic-lyrics"
  mkdir -p "$_path"
  mkdir -p "$_path/contents"
  cp -r "$srcdir/$_reponame-$pkgver/contents"/* "$_path/contents"
  cp -r "$srcdir/$_reponame-$pkgver/metadata.json" "$_path/metadata.json"
  install -Dm 644 "$srcdir/$_reponame-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
