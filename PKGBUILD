pkgname=bun-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('64cf5e0fffaa95eae245e8e8ac95fa61ffd22f170c127bf6187579b66e5164e5b1f7920e573a0f7898e33133b2a70ae0367f32e6a78758f2b36fd56a77445bcb')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
