# Maintainer: tee < teeaur at duck dot com >
pkgname=ws4sqlite-bin
_pkgname=ws4sqlite
pkgver=0.16.1
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
sha256sums_x86_64=('a7558a087399fa1624783f04634cac53c15bfe68d638365053fdb06384138cfc')
sha256sums_arm=('bb1fa10791332d60fc0793a4aff9676f64083c32603ff1f3c41ccbdebea2788e')
sha256sums_arm64=('eee0697897dd58c563026d607ed9ae9c52af11e93659714c9caf02a62d4001a3')

package() {
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
