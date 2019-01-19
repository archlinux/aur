
# Maintainer: Alexander Cardosi <alexanderdcardosi@gmail.com>
pkgname=deno-bin
_pkgname=deno
pkgdesc="A secure TypeScript runtime on V8"
pkgver=0.2.8
pkgrel=1
arch=('x86_64')
license=('MIT')
url='http://deno.land/'
provides=('deno')
makedepends=('binutils')
source_x86_64=("${_pkgname}.gz::https://github.com/denoland/deno/releases/download/v${pkgver}/${_pkgname}_linux_x64.gz")
sha256sums_x86_64=('d069ef4d0b49acc9c50c79da96ee0cc508cf60209681e751c487ca9d0b31b80d')


package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm0755  "$_pkgname" "$pkgdir"/usr/bin/
}
