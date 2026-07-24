# Maintainer: Tom Davenport <1926694+tomdavenport@users.noreply.github.com>
# The binary and project are "meanwhile"; the AUR package is meanwhile-rain
# because AUR's "meanwhile" is the old Lotus Sametime library.
pkgname=meanwhile-rain
_project=meanwhile
pkgver=0.5.1
pkgrel=1
pkgdesc="Horizontal matrix rain of things happening right now — news, local intel and true poetic facts decode out of the code"
arch=('any')
url="https://github.com/tomdavenport/meanwhile"
license=('MIT')
depends=('python')
source=("$_project-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5855e38ac1e32f8b42c22467cab2edd10863f2903c1a7c62e0940c8387e84e90')

package() {
  cd "$_project-$pkgver"
  install -Dm755 meanwhile.py "$pkgdir/usr/bin/meanwhile"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
