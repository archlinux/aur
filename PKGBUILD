# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.11.22
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
_arch=('arm64' 'armhf' 'x64')
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/Enter-tainer/typstyle"
license=('Apache-2.0')
optdepends=("typst: For typst compilation")
provides=("$_pkgname")
conflicts=("$_pkgname")
source_aarch64=("$_pkgname-aarch64::$url/releases/download/v$pkgver/$_pkgname-linux-arm64")
source_armv7h=("$_pkgname-armv7h::$url/releases/download/v$pkgver/$_pkgname-linux-armhf")
source_x86_64=("$_pkgname-x86_64::$url/releases/download/v$pkgver/$_pkgname-linux-x64")
sha256sums_aarch64=('b9b42573df10a240c003834ae11f55ed251296432f1cc68c9568d1d1f1b4eca0')
sha256sums_armv7h=('9ae2736d6287ec29f94c2d8448eb9a054b6774c733e7f534434efe3d722193d6')
sha256sums_x86_64=('e3791b2f5c35e6fdd35a974b44f306ed94a437f2691da3dbc150ab51c9a7ff8e')

package() {
	install -Dm755 "$_pkgname-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}
