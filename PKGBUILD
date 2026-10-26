# Maintainer: ZXY <3303057136@qq.com>

pkgname=verylup-bin
_pkgname=verylup
pkgver=0.1.13
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
sha256sums_x86_64=('ac614e6df9e5ea53b72fdf6c9a7e5e952ff893b0c5385b5b81000240e2c23941')
sha256sums_aarch64=('ac614e6df9e5ea53b72fdf6c9a7e5e952ff893b0c5385b5b81000240e2c23941')
