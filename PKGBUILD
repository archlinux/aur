# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=lightningcss-cli-bin
_pkgname=${pkgname%-bin}
pkgver=1.25.1
pkgrel=1
pkgdesc='Extremely fast CSS parser, transformer, and minifier written in Rust'
arch=(x86_64 aarch64)
url="https://lightningcss.dev/"
license=(MPL-2.0)
source_x86_64=("https://registry.npmjs.org/$_pkgname-linux-x64-gnu/-/$_pkgname-linux-x64-gnu-$pkgver.tgz")
source_aarch64=("https://registry.npmjs.org/$_pkgname-linux-arm64-gnu/-/$_pkgname-linux-arm64-gnu-$pkgver.tgz")
sha256sums_x86_64=(0df137f50e351ea7b1a9355770902854e3b66e3d9a5bbc1a339d9f750cc3ebb7)
sha256sums_aarch64=(1850fd9fda632fa0725e171d8644d6a4c6b45d643da93775a2e33babe4919954)
options=('!strip')

package() {
  cd "$srcdir/package"
  install -Dm755 lightningcss "$pkgdir/usr/bin/lightningcss"
}
