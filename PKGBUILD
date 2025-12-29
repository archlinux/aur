# Maintainer: ZXY <3303057136@qq.com>

pkgname=verylup-bin
_pkgname=verylup
pkgver=0.1.11
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
sha256sums_x86_64=('424de9a27b6667f74a352b058d6638f914e690b1058d16175e3f8fc36165f496')
sha256sums_aarch64=('424de9a27b6667f74a352b058d6638f914e690b1058d16175e3f8fc36165f496')
