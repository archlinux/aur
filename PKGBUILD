# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
# pkgver and sha256sums are filled in by .github/workflows/release.yml on each release.
pkgname=katana-tui-bin
_pkgname=katana-tui
pkgver=1.1.1
pkgrel=1
pkgdesc="Unofficial terminal client for Nonograms Katana user puzzles (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/ArkadyBuryakov/katana-desktop"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('ffd5b9c0e4688ff3602296ee0875e0717da148b2dfa6cd2f3ed223aa75c1eddc')
sha256sums_aarch64=('1c691aeea3790172816c76194063db91876900f953518c38192cd7029f81c41e')

package() {
  cp -a usr "$pkgdir/"
}
