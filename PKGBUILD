# Maintainer: tee < teeaur at duck dot com >
pkgname=ws4sqlite-bin
_pkgname=ws4sqlite
pkgver=0.16.4
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
sha256sums_x86_64=('88345fb7dbc91aa855c46743e80161586a3f85d743692a667841074b91ceffff')
sha256sums_arm=('58a85f813bc6e1929868fe71ea38326cc7675f9a3b0df90d0b7ffab38e5a2bff')
sha256sums_arm64=('25edd7bdde2813a2be0b6b167255e2e1f92ac5fe6392f28950f0846b6e24ed10')

package() {
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
