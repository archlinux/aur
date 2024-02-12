# Maintainer: tblFlip <root@tblflip.de>

pkgname=git-gud
pkgver=1.0.0
pkgrel=1
pkgdesc="An innovative, new method to git --help"

arch=("any")
license=("MIT")

source=(
	"$pkgname"
)

sha256sums=(
	"05de2806450723391196644aafbfefc112dcb0b6dda6548e7d06dc4443fe9fc7"
)

provides=("$pkgname")
conflicts=("$pkgname")
depends=("sh" "git")

package() {
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
}
