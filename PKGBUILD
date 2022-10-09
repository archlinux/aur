# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.26.1
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(deno-${arch}-unknown-linux-gnu.zip::https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(6f1d628267fd44f3b644fa6052af205160c3cdfc3a2ae04049355719c65588ca)
source_aarch64=(deno-linux-arm64.zip::https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(9fe8f2e22f4dd0f7a3ec281fd222764a843a0313b06d8af6e1f1b775c874c908)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
