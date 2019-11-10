# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=tflint
pkgver=0.12.1
pkgrel=2
pkgdesc="A linter for Terraform code"
arch=('i686' 'x86_64')
_vendor="github.com/wata727/${pkgname}"
url="https://${_vendor}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source_i686=("$pkgname-$pkgver-${CARCH}.zip::https://${_vendor}/releases/download/v${pkgver}/tflint_linux_386.zip")
sha256sums_i686=('212f40e21eb5dee8412123142aa87b5152d2042bcbd6d88b0ea2d4334996e831')
sha256sums_x86_64=('5ae01a03a1c0ed0359bd795de735ce5fc8984611cd58866f67a545d7a17209c6')
source_x86_64=("$pkgname-$pkgver-${CARCH}.zip::https://${_vendor}/releases/download/v${pkgver}/tflint_linux_amd64.zip")
_vendorpath="gopath/src/$_vendor"

package() {
  cd $srcdir
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
