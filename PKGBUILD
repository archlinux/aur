# Maintainer: tyrolyean <tyrolyean@tyrolyean.net>
pkgname=hellwal
pkgver=1.0.1
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
	'e0557de29ead44461a2781895e5f25a68f554a376fedc5ff96fba490ed6c1ee6'
	)

sha512sums=(
	'351eeef7f1e01583a80cac7ff482e6a874c252a055819e6bdd8c40830fe3fef3e00390509bf2a7b947ac6303e159ec8fb1d55d9201b754f705a1dbc432efe4da'
	)

md5sums=(
	'a7da0eba823a8e9a1d2d668dc5fe3160'
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
