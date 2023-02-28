# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=dnglab-bin
_pkg="${pkgname%-bin}"
pkgver=0.5.1
pkgrel=1
pkgdesc="Camera RAW to DNG file format converter"
arch=('x86_64' 'aarch64')
url="https://github.com/dnglab/dnglab"
license=('LGPL2.1')
depends=('gcc-libs')
provides=("$_pkg")
conflicts=("$_pkg")
source_x86_64=("$_pkg-$pkgver-x86_64::$url/releases/download/v$pkgver/${_pkg}_linux_x64")
source_aarch64=("$_pkg-$pkgver-aarch64::$url/releases/download/v$pkgver/${_pkg}_linux_aarch64")
sha256sums_x86_64=('c133219d218eae9f8b68155e64c40c0cedc7303ceaa0e6c7916e10860c25bc49')
sha256sums_aarch64=('11edebd3172ea5f1e763046589f7632e9fda6412d489cd4492df9fd4d7ddd18c')

package() {
	install -Dv "$_pkg-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkg"
}
