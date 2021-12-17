# Maintainer: E-Hern Lee <ehern.lee@gmail.com>

pkgname=cloudflare-wrangler-bin
pkgver=1.19.6
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
provides=('cloudflare-wrangler')
arch=('x86_64')
url='https://github.com/cloudflare/wrangler'
license=('Apache' 'MIT')
source=("https://github.com/cloudflare/wrangler/releases/download/v$pkgver/wrangler-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('76683f44edf3bd9cfd40438e05d230d7e9a317abcf1047504df4c9d732e4ff51774e14f246d4edf6d96f8f6b74de9f14e2eae53e936da009dd8238a1719e2735')

package() {
  install -Dm 755 "$srcdir/dist/wrangler" "$pkgdir/usr/bin/wrangler"
}

