# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
# pkgver and sha256sums are filled in by .github/workflows/release.yml on each release.
pkgname=katana-tui-bin
_pkgname=katana-tui
pkgver=1.1.2
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
sha256sums_x86_64=('d0eca82d1288cc3121f3c2a3f09d413e9427dc58c50710d25696d3f66fc30db6')
sha256sums_aarch64=('75f40cbc110ef0884513f153e7757a8499f27df7b388aedd73de4e2ed9d48309')

package() {
  cp -a usr "$pkgdir/"
}
