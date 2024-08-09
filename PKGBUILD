# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.11.31
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
arch=("aarch64" "x86_64" "armv7h")
url="https://github.com/Enter-tainer/typstyle"
license=("Apache-2.0")
depends=("gcc-libs" "glibc")
optdepends=("typst: For typst compilation")
provides=("$_pkgname")
conflicts=("$_pkgname")
source_aarch64=("$_pkgname-aarch64-$pkgver::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu")
source_armv7h=("$_pkgname-armv7h-$pkgver::$url/releases/download/v$pkgver/$_pkgname-arm-unknown-linux-gnueabihf")
source_x86_64=("$_pkgname-x86_64-$pkgver::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu")
sha256sums_aarch64=('80286b03bb21c095402e5fc0d83434ad57b764e0a74b6872ca5dbac022ee219f')
sha256sums_x86_64=('b747107590be0565a169cb8201db22c2e3b55e8453b4bc39eaf205e0cb7843d6')
sha256sums_armv7h=('b4c82e7ef21edc689a6afa8f58688ab1f102a555b0dbaea5652a99613424dc64')

package() {
	install -Dm755 "$_pkgname-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
