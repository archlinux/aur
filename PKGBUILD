# Maintainer: <ehern.lee@gmail.com>

pkgname=cloudflare-wrangler-bin
pkgver=1.16.0
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
license=('Apache' 'MIT')
source=("https://github.com/cloudflare/wrangler/releases/download/v$pkgver/wrangler-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('01a7dfd7da4cf094fd2e893d9bf3d1d2dd8fc14f54557ec090cb6611c6b1386734e007c83c372ca1f6ab5b509f378a38690093c87721930b3407905a81af0dca')

package() {
  install -Dm 755 "$srcdir/dist/wrangler" "$pkgdir/usr/bin/wrangler"
}

