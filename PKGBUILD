
# Maintainer: Alexander Cardosi <alexanderdcardosi@gmail.com>
pkgname=deno-bin
_pkgname=deno
pkgdesc="A secure TypeScript runtime on V8"
pkgver=0.2.11
pkgrel=1
arch=('x86_64')
license=('MIT')
url='http://deno.land/'
provides=('deno')
makedepends=('binutils')
source_x86_64=("${_pkgname}.gz::https://github.com/denoland/deno/releases/download/v${pkgver}/${_pkgname}_linux_x64.gz")
sha256sums_x86_64=('7ce878b0b5f2d5be371720b50d85205df7fbb744c6b0276261766ec712b9285b')


package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm0755  "$_pkgname" "$pkgdir"/usr/bin/
}
