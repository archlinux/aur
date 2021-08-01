# Maintainer: Vedant K (gamemaker1) <gamemaker0042 at gmail dot com>

pkgname=bak-bin
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A backup tool written in bash (binary version)"
arch=("any")
url="https://github.com/gamemaker1/bak"
license=("AGPL3")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
depends=("bash" "coreutils" "tar" "zip" "unzip")
source=("${pkgname%-bin}-$pkgver.tar.zst::https://github.com/gamemaker1/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('cdca97c5822ca6c22f11df30721fe6b6a23073c34c2a89c933bb5461350afb79')

package() {
	install -Dm775 "usr/bin/bak" "$pkgdir/usr/bin/bak"
	install -Dm644 "usr/share/man/man1/bak.1" "$pkgdir/usr/share/man/man1/bak.1"
	install -Dm644 "usr/share/licenses/bak/LICENSE" "$pkgdir/usr/share/licenses/bak/LICENSE"
}
