pkgname=bun-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/Jarred-Sumner/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("https://github.com/Jarred-Sumner/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('011e53b16232138d73489ece61573b6f9077854ae421a21fda2f93edf2530e41978205af16638aa067711bfbcf1854ce5179095e781ac1ba03045987018226a1')


package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
