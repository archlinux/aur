# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.34.1
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(deno-$arch-unknown-linux-gnu.zip::https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(21e06942b2f3922d2fd86d2372e57135a35284f5e4fd867e978cefb2502ce7a1)
source_aarch64=(deno-linux-arm64.zip::https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(8b0f2144be86a1dcb035aafd4e1c3671a525f508bec4abdc0455fe491ed50099)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
