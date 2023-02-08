# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.30.3
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(77ebb253b3bc8ba5ca62b44b60e8b8555c1b3d0011fbcebd1d52291652f834a8)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(1a3aec5aec4c828e822668297d79dcdb0fd125958d0799bc95e887c0fb68d851)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
