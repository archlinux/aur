# Maintainer: ZXY <3303057136@qq.com>

pkgname=verylup-bin
_pkgname=verylup
pkgver=0.1.12
pkgrel=1
pkgdesc="The Veryl toolchain installer"
arch=('x86_64' 'aarch64')
url="https://github.com/veryl-lang/verylup"
license=('Apache-2.0' 'MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-$CARCH-linux.zip")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-$CARCH-mac.zip")

package() {
  install -Dm 755 "$_pkgname" -t "${pkgdir}/usr/bin"
}
sha256sums_x86_64=('f58e996ac17e0107149a2bccfded3e81a3f1f52f78a3a54c1634b6ce04f33e23')
sha256sums_aarch64=('f58e996ac17e0107149a2bccfded3e81a3f1f52f78a3a54c1634b6ce04f33e23')
