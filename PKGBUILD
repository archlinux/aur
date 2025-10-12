# Maintainer: Eric Zhao <21zhaoe@protonmail.com>
pkgbase=ttf-esagil
pkgname=ttf-esagil
pkgver=20210910
pkgrel=1
pkgdesc='Neo-Babylonian cuneiform font'
provides=(ttf-esagil)
arch=(any)
url='https://www.hethport.uni-wuerzburg.de/cuneifont/'
license=('CC-BY-SA-4.0')
source=(https://www.hethport.uni-wuerzburg.de/cuneifont/download/Esagil.ttf)
sha256sums=('ce716f8bd28eaa0f6d25df02b3710dc41b339a29221d5ff014d8538201fdf180')

package_ttf-esagil() {
  install -Dm644 Esagil.ttf -t "$pkgdir"/usr/share/fonts/TTF/
}
