# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.29.4
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(7f158bbfcd502e84da01a668e2410a538e82eeb1902f8929e318e33b7220a52e)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(324c10a4bc8b4b731c7251008b8caae3f4c2a9f5b69c3546d8e991f614cdf0aa)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
