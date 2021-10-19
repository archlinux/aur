# Maintainer: E-Hern Lee <ehern.lee@gmail.com>

pkgname=cloudflare-wrangler-bin
pkgver=1.19.4
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
provides=('cloudflare-wrangler')
arch=('x86_64')
url='https://github.com/cloudflare/wrangler'
license=('Apache' 'MIT')
source=("https://github.com/cloudflare/wrangler/releases/download/v$pkgver/wrangler-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('135981c06d7a1d29c31826a9b99c80a782d3d738818d14c6c4c402eea3b242c89d267c74578d6cd01a2c85ba1de2a3c1d741de0004c716c38679d6bca0e5d4fb')

package() {
  install -Dm 755 "$srcdir/dist/wrangler" "$pkgdir/usr/bin/wrangler"
}

