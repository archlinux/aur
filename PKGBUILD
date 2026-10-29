# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
# pkgver and sha256sums are filled in by .github/workflows/release.yml on each release.
pkgname=katana-tui-bin
_pkgname=katana-tui
pkgver=1.1.5
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
sha256sums_x86_64=('e055742bc16ad1f7cdbb9fec9467a01b6ca591c2c47033d142045698637b8cd8')
sha256sums_aarch64=('9a414f7709bda573986415268447a89a22e9d72c42f303835d13731208d877f1')

package() {
  cp -a usr "$pkgdir/"
}
