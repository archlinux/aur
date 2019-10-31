# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=tflint
pkgver=0.12.1
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('i686' 'x86_64')
_vendor="github.com/wata727/${pkgname}"
url="https://${_vendor}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("https://${_vendor}/releases/download/v${pkgver}/tflint_linux_386.zip")
md5sums=('b85b27a2fcc1bf68119a06428a5c1138')
_vendorpath="gopath/src/$_vendor"

package() {
  cd $srcdir
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
