# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=tflint
pkgver=0.7.6
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('i686' 'x86_64')
_vendor="github.com/wata727/${pkgname}"
url="https://${_vendor}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("https://${_vendor}/releases/download/v${pkgver}/tflint_linux_386.zip")
md5sums=('c6247b9e1de95cb04d3365fe88b45f67')
_vendorpath="gopath/src/$_vendor"

package() {
  cd $srcdir
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
