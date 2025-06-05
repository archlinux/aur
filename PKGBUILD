# Maintainer: ZXY <3303057136@qq.com>

pkgname=verylup-bin
_pkgname=verylup
pkgver=0.1.5
pkgrel=1
pkgdesc="The Veryl toolchain installer"
arch=('x86_64' 'aarch64')
url="https://github.com/veryl-lang/verylup"
license=('Apache-2.0' 'MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-$CARCH-linux.zip")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-$CARCH-mac.zip")

sha256sums_x86_64=('cc46659ed52b54c26721f47f0fab31b4bfc8adcc279222b5560b31f77bfe6c20')
sha256sums_aarch64=('4ddb685634a07df0202e2bce838017fff3b354e5e86ca41f49e4025a2b81d2e9')

package() {
  install -Dm 755 "$_pkgname" -t "${pkgdir}/usr/bin"
}
