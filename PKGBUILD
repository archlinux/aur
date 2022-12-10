# Maintainer: coxackie
pkgname=julia-workarounds
pkgver=2022.12.10
pkgrel=1
pkgdesc='Workarounds to make Julia built against system libraries work better'
arch=('x86_64')
depends=('julia' 'openblas')

package() {
  install -dm755 "$pkgdir/usr/lib/"
  cd "$pkgdir/usr/lib/"
  ln -s libopenblas.so libopenblas64_.so
}

