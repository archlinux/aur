# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=tflint
pkgver=0.4.2
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('i686' 'x86_64')
_vendor="github.com/wata727/${pkgname}"
url="https://${_vendor}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("https://${_vendor}/releases/download/v${pkgver}/tflint_linux_386.zip")
md5sums=('df8da5a1a615ae68bdc9ac8b94dd64f1')

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
