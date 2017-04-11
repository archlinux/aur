# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=tflint
pkgver=0.3.3
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('i686' 'x86_64')
_vendor="github.com/wata727/${pkgname}"
url="https://${_vendor}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("https://${_vendor}/releases/download/v${pkgver}/tflint_linux_386.zip")
md5sums=('d3cb496b7f05a8a7ff6b4c897bb2c9c9')

_vendorpath="gopath/src/$_vendor"

# prepare() {
#   mkdir -p $_vendorpath
#   mv -T $pkgname-$pkgver $_vendorpath
# }

# build() {
#   export GOPATH="$srcdir/gopath"
#   cd $_vendorpath
#   go build -o bin/$pkgname
# }

package() {
  cd $srcdir
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
