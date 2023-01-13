pkgname=bun-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('b4f2ed9e3df4337ad71ae822b36b517a42ed715a546f1700972b4bd5b9d3fdb6bef25647fe5b6c534c435b1e52fded43d86c664f43e9b26fade11fdb09eb1f53')


package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
