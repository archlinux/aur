# Maintainer: tyrolyean <tyrolyean@tyrolyean.net>
# Co-Maintainer: danihek <danihek07@gmail.com>
pkgname=hellwal
pkgver=1.0.2
pkgrel=1
pkgdesc="fast, extensible color palette generator"
arch=('i686' 'x86_64' 'arm' 'aarch64' 'riscv')
url="https://github.com/danihek/hellwal"
license=('MIT')
makedepends=('make')
source=(
	"https://github.com/danihek/${pkgname}/archive/refs/tags/v${pkgver}/v${pkgver}.tar.gz"
	)

sha256sums=(
	'eff95d7a0403fc06d57917e4b4d4dbf897a6f0300104592cf95be7b54c83bc90'
	)

sha512sums=(
	'23f50b40e227466051ea0bc9f672e48d176cf92c9ccb4b9f413056be59be4c112043775e6a4cd43f1c4712ca8a8e18749392c583a6c22f1e227fee5d4f34aa50'
	)

md5sums=(
	'453e2581a41c92b66d2cf1ea1fabe135'
	)

build() {
	cd ${pkgname}-${pkgver}
	make ${pkgname}
}

package() {
	install -D ${pkgname}-${pkgver}/${pkgname} $pkgdir/usr/bin/${pkgname}
	install -D ${pkgname}-${pkgver}/templates/colors $pkgdir/usr/share/docs/${pkgname}/colors
	install -D ${pkgname}-${pkgver}/templates/colors.css $pkgdir/usr/share/docs/${pkgname}/templates/colors.css
	install -D ${pkgname}-${pkgver}/templates/colors.json $pkgdir/usr/share/docs/${pkgname}/templates/colors.json
	install -D ${pkgname}-${pkgver}/templates/colors-rgb $pkgdir/usr/share/docs/${pkgname}/templates/colors-rgb
	install -D ${pkgname}-${pkgver}/templates/discord-colors.css $pkgdir/usr/share/docs/${pkgname}/templates/discord-colors.css
	install -D ${pkgname}-${pkgver}/templates/foot-colors.ini $pkgdir/usr/share/docs/${pkgname}/templates/foot-colors.ini
	install -D ${pkgname}-${pkgver}/templates/hyprland-colors.conf $pkgdir/usr/share/docs/${pkgname}/templates/hyprland-colors.conf
	install -D ${pkgname}-${pkgver}/templates/terminal.sh $pkgdir/usr/share/docs/${pkgname}/templates/terminal.sh
	install -D ${pkgname}-${pkgver}/templates/variables.sh $pkgdir/usr/share/docs/${pkgname}/templates/variables.sh
	install -D ${pkgname}-${pkgver}/templates/colors.vim $pkgdir/usr/share/docs/${pkgname}/templates/colors.vim
	install -D ${pkgname}-${pkgver}/templates/waybar-colors.css $pkgdir/usr/share/docs/${pkgname}/templates/waybar-colors.css
	install -D ${pkgname}-${pkgver}/themes/catppuccin.hellwal $pkgdir/usr/share/docs/${pkgname}/themes/catppuccin.hellwal
	install -D ${pkgname}-${pkgver}/themes/gruvbox.hellwal $pkgdir/usr/share/docs/${pkgname}/themes/gruvbox.hellwal
	install -D ${pkgname}-${pkgver}/themes/gruvbox-light.hellwal $pkgdir/usr/share/docs/${pkgname}/themes/gruvbox-light.hellwal
	install -D ${pkgname}-${pkgver}/themes/gruvbox-material.hellwal $pkgdir/usr/share/docs/${pkgname}/themes/gruvbox-material.hellwal
	install -D ${pkgname}-${pkgver}/themes/kanagawa.hellwal $pkgdir/usr/share/docs/${pkgname}/themes/kanagawa.hellwal
	install -D ${pkgname}-${pkgver}/themes/onedark.hellwal $pkgdir/usr/share/docs/${pkgname}/themes/onedark.hellwal
	install -D ${pkgname}-${pkgver}/themes/tokyo-night.hellwal $pkgdir/usr/share/docs/${pkgname}/themes/tokyo-night.hellwal
	install -D ${pkgname}-${pkgver}/themes/zenbones.hellwal $pkgdir/usr/share/docs/${pkgname}/themes/zenbones.hellwal
	install -D ${pkgname}-${pkgver}/themes/zenbones-light.hellwal $pkgdir/usr/share/docs/${pkgname}/themes/zenbones-light.hellwal
}
