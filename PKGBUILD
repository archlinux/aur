# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
# pkgver and sha256sums are filled in by .github/workflows/release.yml on each release.
pkgname=katana-tui-bin
_pkgname=katana-tui
pkgver=1.1.3
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
sha256sums_x86_64=('f3cb8d3ac5781fef32c68317d058d1244fa54dd923142d8de625dd763dc1a619')
sha256sums_aarch64=('f1d1939c25e47addf19a8e8e8fc301700021c62059f28722e9827405dcb1ac28')

package() {
  cp -a usr "$pkgdir/"
}
