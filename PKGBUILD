# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributor: Julian Daube <joposter at gmail dot com>

pkgname=swaycwd
pkgver=2.0
pkgrel=1
pkgdesc="Print the working directory of the focused sway window"
arch=("any")
url="https://aur.archlinux.org/packages/swaycwd"
license=("0BSD")
depends=("bash" "coreutils" "jq" "sway")
source=("swaycwd" "LICENSE")
sha256sums=("6a996b23162eeedc52cee93f539653913443ae50a6da5e19789e625e11aa9287"
	"7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3")

package() {
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 755 swaycwd -t "$pkgdir/usr/bin/"
}
