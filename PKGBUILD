# Maintainer: jdev082 <jdev0894@gmail.com>

pkgname=cutentr-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="POC Qt 3DS streaming client for NTR CFW"
arch=('x86_64')
url="https://gitlab.com/BoltsJ/cuteNTR"
license=('GPL3')
source=("https://github.com/jdev082/aur-binaries/raw/main/cutentr-0.3.3.tar.gz")
md5sums=("c089f97a4cc3706ae1057ba2872d5bae")

package() {
  mkdir -p $pkgdir/usr
  cp -r $srcdir/cutentr-${pkgver}/usr/. $pkgdir/usr
}