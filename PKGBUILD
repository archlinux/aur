# Maintainer: fnrir <fnr1r0@protonmail.com>
pkgname=vscodium-prod-patcher
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Universal patcher for VSCodium"
arch=(any)
url=""
license=('GPL')
groups=()
depends=(
	vscodium
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!debug)
install=
changelog=
source=(
	features-patch.json
	util.py
	vscodium-prod-patcher.hook
)
noextract=()
sha256sums=(
	18266dd33e987ad007ea56da2533925d3ddb84e1bac9c013cb2d513b79c0d59b
	SKIP
	SKIP
)
validpgpkeys=()

package() {
	install -Dm 644 features-patch.json "$pkgdir/usr/share/$pkgname/features-patch.json"
	install -Dm 755 util.py "$pkgdir/usr/share/$pkgname/util.py"
	install -Dm 644 vscodium-prod-patcher.hook "$pkgdir/usr/share/libalpm/hooks/97-vscodium-prod-patcher-self.hook"
}
