# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.11.30
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
sha256sums_aarch64=('55e346d812e62c973625d36425d7184b2b1082357362222f61c104afcd6e5ae3')
sha256sums_x86_64=('b216dbf631c0cb5e8154b80da08d6efd432d796eddadc3f1cfc61ed4765a92db')
sha256sums_armv7h=('29ae8e4089e2c3ac682dde526711cc454a66048bc4fa19e745fac2f881e9f268')

package() {
	install -Dm755 "$_pkgname-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
