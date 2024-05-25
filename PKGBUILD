# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.11.23
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/Enter-tainer/typstyle"
license=('Apache-2.0')
depends=("gcc-libs" "glibc")
optdepends=("typst: For typst compilation")
provides=("$_pkgname")
conflicts=("$_pkgname")
source_aarch64=("$_pkgname-$CARCH::$url/releases/download/v$pkgver/$_pkgname-linux-arm64")
source_armv7h=("$_pkgname-$CARCH::$url/releases/download/v$pkgver/$_pkgname-linux-armhf")
source_x86_64=("$_pkgname-$CARCH::$url/releases/download/v$pkgver/$_pkgname-linux-x64")
sha256sums_aarch64=('dd07053e3a7863138d81a19de480cdcb1ce04d6edbd90d33d712ea75a0cdd544')
sha256sums_armv7h=('b3f75ffb40fbd8df856c2a08772cec2517683e5da4162c37ab4ba48337ae8a23')
sha256sums_x86_64=('be6d6cfed708c147678b6b4ecc67573ba9fd41d03546918b471d75693899f02a')

package() {
	install -Dm755 "$_pkgname-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}
