# Maintainer: tyrolyean <tyrolyean@tyrolyean.net>
# Co-Maintainer: danihek <danihek07@gmail.com>
pkgname=hellwal
pkgver=1.0.3
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
	'2b841d03fe057e30cd1200283361f5ca2f0320aaf2ae7828ace3ce6721633ea8'
	)

sha512sums=(
	'87c365d8619e20cbacac8a1ad34f860fb5699e9b86d6dc50c62de5877a743d745f6924130e6fc012ff974e0acc2002d947ba1a47b32dea7983aa56f6dbdb1800'
	)

md5sums=(
	'392eaaf1b831e5d18ab9fe6bc4e4fd3b'
	)

build() {
	cd ${pkgname}-${pkgver}
	make ${pkgname}
}

package() {
	install -D ${pkgname}-${pkgver}/${pkgname} $pkgdir/usr/bin/${pkgname}
	install -D ${pkgname}-${pkgver}/assets/hellwal-completion.bash $pkgdir/usr/share/bash-completion/completions/${pkgname}
	install -D ${pkgname}-${pkgver}/templates/colors $pkgdir/usr/share/docs/${pkgname}/templates/colors
	install -D ${pkgname}-${pkgver}/templates/colors.css $pkgdir/usr/share/docs/${pkgname}/templates/colors.css
	install -D ${pkgname}-${pkgver}/templates/colors.json $pkgdir/usr/share/docs/${pkgname}/templates/colors.json
	install -D ${pkgname}-${pkgver}/templates/colors-rgb $pkgdir/usr/share/docs/${pkgname}/templates/colors-rgb
	install -D ${pkgname}-${pkgver}/templates/discord-colors.css $pkgdir/usr/share/docs/${pkgname}/templates/discord-colors.css
	install -D ${pkgname}-${pkgver}/templates/foot-colors.ini $pkgdir/usr/share/docs/${pkgname}/templates/foot-colors.ini
	install -D ${pkgname}-${pkgver}/templates/hyprland-colors.conf $pkgdir/usr/share/docs/${pkgname}/templates/hyprland-colors.conf
	install -D ${pkgname}-${pkgver}/templates/terminal.sh $pkgdir/usr/share/docs/${pkgname}/templates/terminal.sh
	install -D ${pkgname}-${pkgver}/templates/variables.sh $pkgdir/usr/share/docs/${pkgname}/templates/variables.sh
	install -D ${pkgname}-${pkgver}/templates/variablesfish.fish $pkgdir/usr/share/docs/${pkgname}/templates/variablesfish.fish
	install -D ${pkgname}-${pkgver}/templates/hellwm.lua $pkgdir/usr/share/docs/${pkgname}/templates/hellwm.lua
	install -D ${pkgname}-${pkgver}/templates/rofi.rasi $pkgdir/usr/share/docs/${pkgname}/templates/rofi.rasi
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
