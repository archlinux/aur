# Maintainer: Redson <redson at riseup.net>

_init_system=dinit
_basename=zerotier-one

pkgname=${_basename}-${_init_system}
pkgver=1.0.0
pkgrel=1

pkgdesc="dinit service scripts for zerotier-one"
url="https://github.com/zerotier/ZeroTierOne"
arch=("any")
license=("GPL3")

source=(
	"${_basename}"
)

sha256sums=('0392bb2bdff6e162f1302dfdf96459cd2f044ae3d57c1dad11001fd43e077190')

depends=(
	"${_basename}"
	"${_init_system}"
)

package() {
	mkdir -p "$pkgdir/etc/dinit.d/${basename}"
	install -Dm644 zerotier-one "$pkgdir/etc/dinit.d/${basename}"
}

