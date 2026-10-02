# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
# pkgver and sha256sums are filled in by .github/workflows/release.yml on each release.
pkgname=katana-tui-bin
_pkgname=katana-tui
pkgver=1.1.0
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
sha256sums_x86_64=('730cbdcd3e8d2126da27a84e45213a907056458801c28948135522b95781c5c2')
sha256sums_aarch64=('0f52e642bad139c4b2f0e0fe0c53299ad825669d156c41558cb5987f83434197')

package() {
  cp -a usr "$pkgdir/"
}
