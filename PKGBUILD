# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.32.4
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(deno-$arch-unknown-linux-gnu.zip::https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(40247b2589062bb2036d448d7125e28bb01da268a17bde74b8ced69818066a4a)
source_aarch64=(deno-linux-arm64.zip::https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(d261ba0dc486e6f9ccb03bc6a92f6980c06d867993b618c3286191e6f948a632)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
