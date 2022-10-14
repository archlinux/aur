pkgname=bun-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('ea8dc1b4bd8c9598b95e4b113b2c5216bb95d624d055c63467cca17af0a29d6f99b2c4866d8019f292d987370d2011adf93a9063be825b7e6b923fdd0048afa6')


package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
