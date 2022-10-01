# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.26.0
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(deno-${arch}-unknown-linux-gnu.zip::https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(064fa0fbf93f91f2eea55234ff53ca42411c6fecf3e13df5240a4a1713ff9ce1)
source_aarch64=(deno-linux-arm64.zip::https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(019dd5af7fef99057884ce1f1802b860c8c4c940cef0bedf924a8ab1777f7b6c)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
