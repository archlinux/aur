# Maintainer: Noel Jacob
# Contributor: thdxr (original PKGBUILD)
# Contributor: 37h4n (aarch64 support added by Ethan Reece <aur at ethanreece dot com>)
pkgname=bunjs-baseline-bin
pkgver=0.6.14
pkgrel=1
pkgdesc="Bun for non-AVX2 CPUs. All-in-one JavaScript runtime built for speed, with a native bundler, transpiler, test runner, and npm-compatible package manager baked-in."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
conflicts=("bun" "bun-bin")
source=("bun-linux-x64-${pkgver}-baseline.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64-baseline.zip")
sha256sums=('16bd1880f40e52e6dbe3aef0f37ea7225edf69e6a92adcdcba0347919996d60b')

package() {
  install -Dm755 "./bun-linux-x64-baseline/bun" "${pkgdir}/usr/bin/bun"
}

