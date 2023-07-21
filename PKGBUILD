# Maintainer: tee < teeaur at duck dot com >
pkgname=ws4sqlite-bin
_pkgname=ws4sqlite
pkgver=0.15.0
pkgrel=1
pkgdesc="Query sqlite via http"
arch=(x86_64 arm arm64)
url="https://github.com/proofrock/ws4sqlite"
license=(ISC)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/raw/main/LICENSE")
source_x86_64=("$url/releases/download/v$pkgver/ws4sqlite-v$pkgver-linux-amd64.tar.gz")
source_arm=("$url/releases/download/v$pkgver/ws4sqlite-v$pkgver-linux-arm.tar.gz")
source_arm64=("$url/releases/download/v$pkgver/ws4sqlite-v$pkgver-linux-arm64.tar.gz")
sha256sums=('4c2dd071b01e0d3a11b5879006e3a6c246dd524b225c5c897ef152f915a05a9a')
sha256sums_x86_64=('e18cf7e37276f0ae3dfca3d8ced3ae4f4f195f7a8fe6e43cbd3b6629b2835b5c')
sha256sums_arm=('72734b5abbfd79daaa754c6903834a4744cadd035e1b0174a880df2776b8bfd2')
sha256sums_arm64=('cedfe5421a008ef6d1edbd437f7d374a9fae0ac091fda9522266762be7365dcd')

package() {
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
