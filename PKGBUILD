# Maintainer: tee < teeaur at duck dot com >
pkgname=ws4sqlite-bin
_pkgname=ws4sqlite
pkgver=0.16.0
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
sha256sums_x86_64=('8bcd97c33ec51c44795d675d427700cd87a36e08aa5a7d569890b3b5f898f015')
sha256sums_arm=('8d50206f16e84e1c0ed03229b3f16faa451884af1fce09809aa2dac57c9054a7')
sha256sums_arm64=('257ece2689fa80992095d2518c1a5ab7b54366d87c1532760918120468015dc3')

package() {
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
