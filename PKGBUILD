pkgname=bun-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('1994efece2bfc02810d09f98d2bc00c885bfcfdf92f889c3fbdb0a3aab455153a46ecf325dc093ce6bc6d5d4ffc9eef4ded18ae0b25487abb86f43643b342be4')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
