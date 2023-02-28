# Maintainer: Noel Jacob
# Contributor: thdxr
pkgname=bunjs-bin
pkgver=0.5.7
pkgrel=1
pkgdesc="All-in-one JavaScript runtime built for speed, with a native bundler, transpiler, test runner, and npm-compatible package manager baked-in. Run, test, transpile, and bundle JavaScript & TypeScript projects — all in Bun."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
conflicts=("bun" "bun-bin")
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha256sums=('b8e5474088ef656d06aaffc62e5bdb5e5e5b0dc9f047cd003f5954276bf66683')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
