pkgname=bun-bin
pkgver=0.6.5
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('60c5a7e812243ea8e250d429b7a29e26ba190402d857ecd7026285217cf1095a15b6583351f62e0814c9a332b7541b65f0f0b19ae7ba282dc45bf9ac5e327817')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
