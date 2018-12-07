
# Maintainer: Alexander Cardosi <alexanderdcardosi@gmail.com>
pkgname=deno-bin
_pkgname=deno
pkgdesc="A secure TypeScript runtime on V8"
pkgver=0.2.1
pkgrel=1
arch=('x86_64')
license=('MIT')
url='http://deno.land/'
provides=('deno')
makedepends=('binutils')
source_x86_64=("${_pkgname}.gz::https://github.com/denoland/deno/releases/download/v${pkgver}/${_pkgname}_linux_x64.gz")
sha256sums_x86_64=('eeb852537050d6045c96c2716f939d0e4f4fe22343fb83ebeb5215e029a30285')


package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm0755  "$_pkgname" "$pkgdir"/usr/bin/
}
