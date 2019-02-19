
# Maintainer: Alexander Cardosi <alexanderdcardosi@gmail.com>
pkgname=deno-bin
_pkgname=deno
pkgdesc="A secure TypeScript runtime on V8"
pkgver=0.3.0
pkgrel=1
arch=('x86_64')
license=('MIT')
url='http://deno.land/'
provides=('deno')
makedepends=('binutils')
source_x86_64=("${_pkgname}.gz::https://github.com/denoland/deno/releases/download/v${pkgver}/${_pkgname}_linux_x64.gz")
sha256sums_x86_64=('b53230f0bd188e382e285c14a61b839bbbfb0253dadf6933d1c6cee8fce391db')


package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm0755  "$_pkgname" "$pkgdir"/usr/bin/
}
