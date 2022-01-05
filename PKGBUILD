# Maintainer: E-Hern Lee <ehern.lee@gmail.com>

pkgname=cloudflare-wrangler-bin
pkgver=1.19.7
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
provides=('cloudflare-wrangler')
arch=('x86_64')
url='https://github.com/cloudflare/wrangler'
license=('Apache' 'MIT')
source=("https://github.com/cloudflare/wrangler/releases/download/v$pkgver/wrangler-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('7a2aa6b3be4d7e93400a39f243fade4e41b1e1d2fde2f97cdb82f1f9356c5034ed713a3172a30550f9c917bb5294963f993af0e2cb7ac310b3401ce9a9df6967')

package() {
  install -Dm 755 "$srcdir/dist/wrangler" "$pkgdir/usr/bin/wrangler"
}

