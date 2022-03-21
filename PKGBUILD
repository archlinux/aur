# Maintainer: E-Hern Lee <ehern.lee@gmail.com>

pkgname=cloudflare-wrangler-bin
pkgver=1.19.10
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
provides=('cloudflare-wrangler')
arch=('x86_64')
url='https://github.com/cloudflare/wrangler'
license=('Apache' 'MIT')
source=("https://github.com/cloudflare/wrangler/releases/download/v$pkgver/wrangler-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('3254c57e9ca51d78ca079a3bb789ba9ca72bd9dab8d74a29296bce4d81512d20887026d6a68b65c8693427391f40684d3c906a8b319cddb17d1321919e79264d')

package() {
  install -Dm 755 "$srcdir/dist/wrangler" "$pkgdir/usr/bin/wrangler"
}

