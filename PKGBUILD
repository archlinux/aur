# Maintainer: tee < teeaur at duck dot com >
pkgname=ws4sqlite-bin
_pkgname=ws4sqlite
pkgver=0.16.3
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
sha256sums_x86_64=('50e7ca9065920fb365909b54d798d581a03740d6a2ab420d6aca286d80a7d4b2')
sha256sums_arm=('bbb178ae0c00cb5562be8afda216403f3f52d32dc8ca78642b99927d1c252ef6')
sha256sums_arm64=('54fd8c90813fc63e722836fadc4c061709d61c36a31b4ef031178be7079ecf99')

package() {
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
