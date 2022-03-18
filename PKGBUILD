# Maintainer: E-Hern Lee <ehern.lee@gmail.com>

pkgname=cloudflare-wrangler-bin
pkgver=1.19.9
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
provides=('cloudflare-wrangler')
arch=('x86_64')
url='https://github.com/cloudflare/wrangler'
license=('Apache' 'MIT')
source=("https://github.com/cloudflare/wrangler/releases/download/v$pkgver/wrangler-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('4e45292a84408b12421c58a2047726a0db32386b97ad9c27d008c537e2dbf24554163a55654d1499388c060f64915fe2e10c3bd23ec7348f6c9f6ca33a187900')

package() {
  install -Dm 755 "$srcdir/dist/wrangler" "$pkgdir/usr/bin/wrangler"
}

