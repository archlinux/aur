pkgname=bun-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('6cc7709bbdf0df2145c990efac310fb5673dbd6f70d435e4ef429930450c2ee4d73bafdd8ad10c084509312b286e0d939eb99298527d3c30d6af7f301e466bda')


package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
