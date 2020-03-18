# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=wrangler-bin
pkgver=1.8.2
pkgrel=1
pkgdesc='Cowboy wrangle your cloudflare workers'
arch=('x86_64')
url="https://workers.cloudflare.com"
license=('Apache2')
provides=('cloudflare-wrangler')
source=("https://github.com/cloudflare/wrangler/releases/download/v${pkgver}/wrangler-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
md5sums=('7250601bb967fc8ce05c29b21e0a6a29')

package() {
  cd "${srcdir}"
  install -Dm755 dist/wrangler "${pkgdir}/usr/bin/wrangler"
}
# vim:set ts=2 sw=2 et: