pkgname=bun-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('842feefa3b045b5805024cdd976063cae60e1b16aeebf8a9395ce19d70437e382a086eb8ebdcaef005311e869937c4b8255ba287dc7254a4234bcd3e21cc76dc')


package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
