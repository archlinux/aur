# Maintainer: BNDays27 <brionical@proton.me>
_pkgname=silvervine
pkgname=$_pkgname-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="Cross-platform Widevine helper for Chromium based browsers"
optdepends=(
	'helium-browser-bin: Compatible browser'
	'chromium: Compatible browser'
	'thorium-browser: Compatible browser'
)
arch=(x86_64)
url="https://github.com/nicholasraimbault/silvervine"
license=('MIT')
source=("$_pkgname-$pkgver.tar.xz::$url/releases/download/v${pkgver}/silvervine-x86_64-unknown-linux-musl.tar.xz")
sha256sums=("d9cfeda39a6b5ee34db0ffedef7b030db6fd910e3bc74b41c35dce061231ebd8")

package() {
	install -Dm755 "$srcdir/silvervine-x86_64-unknown-linux-musl/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 $srcdir/silvervine-x86_64-unknown-linux-musl/LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
