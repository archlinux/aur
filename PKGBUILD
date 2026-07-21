# Maintainer: Tom Davenport <1926694+tomdavenport@users.noreply.github.com>
# The binary and project are "meanwhile"; the AUR package is meanwhile-rain
# because AUR's "meanwhile" is the old Lotus Sametime library.
pkgname=meanwhile-rain
_project=meanwhile
pkgver=0.4.0
pkgrel=1
pkgdesc="Horizontal matrix rain of things happening right now — news, local intel and true poetic facts decode out of the code"
arch=('any')
url="https://github.com/tomdavenport/meanwhile"
license=('MIT')
depends=('python')
source=("$_project-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6448ae65884c78836e35b97dd277ab6dc66882e6dc8d79bb9e81b1b1db5d2577')

package() {
  cd "$_project-$pkgver"
  install -Dm755 meanwhile.py "$pkgdir/usr/bin/meanwhile"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
