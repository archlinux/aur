# Maintainer: Noel Jacob
# Contributor: thdxr (original PKGBUILD)
# Contributor: 37h4n (aarch64 support added by Ethan Reece <aur at ethanreece dot com>)
pkgname=bunjs-baseline-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Bun for non-AVX2 CPUs. All-in-one JavaScript runtime built for speed, with a native bundler, transpiler, test runner, and npm-compatible package manager baked-in."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
conflicts=("bun" "bun-bin")
source=("bun-linux-x64-${pkgver}-baseline.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64-baseline.zip")
sha256sums=('66e9a9ecce68557a38899ba2b8d0c689c8fe6af078034ab73f514a7ddd56f403')

package() {
  install -Dm755 "./bun-linux-x64-baseline/bun" "${pkgdir}/usr/bin/bun"
}

