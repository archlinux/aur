pkgname=bun-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/Jarred-Sumner/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("https://github.com/Jarred-Sumner/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('d40edb955e5d3ab4cebe525140fe4312b30f7db57362269a6a979c96d19209d8b8e886b69cf970f4a0c9618bb444cefaa4d84e31ff7abcdd2f245cfd50e525e5')


package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
