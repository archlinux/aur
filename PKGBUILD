# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.25.3
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(deno-${arch}-unknown-linux-gnu.zip::https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(46d50bc9d05ac1a43939cb992410bd48abdaf09d8482cbf40a6fcda56958be8f)
source_aarch64=(deno-linux-arm64.zip::https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(7d881af674f715a13d0c0e4fdb332434e3f6d558b6323aac32de38e920b4d9db)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
