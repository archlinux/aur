# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=lightningcss-cli-bin
_pkgname=${pkgname%-bin}
pkgver=1.23.0
pkgrel=1
pkgdesc='Extremely fast CSS parser, transformer, and minifier written in Rust'
arch=(x86_64 aarch64)
url="https://lightningcss.dev/"
license=(MPL-2.0)
source_x86_64=("https://registry.npmjs.org/$_pkgname-linux-x64-gnu/-/$_pkgname-linux-x64-gnu-$pkgver.tgz")
source_aarch64=("https://registry.npmjs.org/$_pkgname-linux-arm64-gnu/-/$_pkgname-linux-arm64-gnu-$pkgver.tgz")
sha256sums_x86_64=(15e216dee168f8dbd270121037f2f7a5a55831de9c027d3651b49ba3ed6b23c8)
sha256sums_aarch64=(ad39eee2723e0adbe1b0de63ce8aeb3485ae22d95b202cbd96b5c5f51a12d8db)
options=('!strip')

package() {
  cd "$srcdir/package"
  install -Dm755 lightningcss "$pkgdir/usr/bin/lightningcss"
}
