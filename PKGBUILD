# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.33.2
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(deno-$arch-unknown-linux-gnu.zip::https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(789785dc84ff429a7b4ec67b45bbb99334439034057ef0963ca9ed2285f9b9f6)
source_aarch64=(deno-linux-arm64.zip::https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(32a733ceee8d83670053261373cb82d41ab80d9b8cefff837a575e498db200f3)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
