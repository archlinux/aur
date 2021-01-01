# Maintainer: DEBUCQUOY Anthony <d.tonitch@gmail.com>
pkgname="ttf-firacode"
pkgver=5.2
pkgrel=1
pkgdesc="Fira Code Font ttf"
arch=(any)
url="https://github.com/tonsky/FiraCode"
license=('SIL')
depends=(fontconfig xorg-mkfontscale)
source=("${url}/releases/download/${pkgver}/Fira_Code_v${pkgver}.zip")
sha256sums=('521a72be00dd22678d248e63f817c0c79c1b6f23a4fbd377eba73d30cdca5efd')

package() {
	mkdir -p "$pkgdir/usr/share/fonts/${fontname}"
	cp "${srcdir}/ttf/"*.ttf "$pkgdir/usr/share/fonts/${fontname}"
}
