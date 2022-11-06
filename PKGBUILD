# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.27.1
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(9e42a7933212d530a593bc9f0ad7cccbb8cc196bfe26c704f938eeeb8ec08fff)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(8d10775736664accb69bfe571df1294c998f40fb475de8eab4c6ef007ddf3880)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
