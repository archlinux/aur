# Maintainer: tyrolyean <tyrolyean@tyrolyean.net>
# Co-Maintainer: danihek <danihek07@gmail.com>
pkgname=hellwal
pkgver=1.0.9
pkgrel=1
pkgdesc="fast, extensible color palette generator"
arch=('any')
url="https://github.com/danihek/hellwal"
license=('MIT')
makedepends=('make')
source=(
	"https://github.com/danihek/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	)

sha512sums=('900fa0d7191551013d1749ef1d87d69e492e6211b52b5496370484a6392ca5488315b681ade3447c8a7e7e46052ea28527618e56e4f0c613f5c7d11d16882945')
b2sums=('de5b077e69346676621cc7e973e4ae21a0311c5738d95a904bbe106fdb57a3732dabc4042676790a9997734516368c8ae48941bd9c581b0763d20a72b931734a')


build() {
	cd ${pkgname}-${pkgver}
	make debug
}

package() {
	# pkg
	install -D ${pkgname}-${pkgver}/${pkgname} $pkgdir/usr/bin/${pkgname}

	# bash completion
	install -D ${pkgname}-${pkgver}/assets/hellwal-completion.bash $pkgdir/usr/share/bash-completion/completions/${pkgname}

	# fish completion
	install -D ${pkgname}-${pkgver}/assets/hellwal.fish $pkgdir/usr/share/fish/vendor_completions./${pkgname}.fish

	# templates
	install -D ${pkgname}-${pkgver}/templates/alphacolors.css $pkgdir/usr/share/docs/${pkgname}/templates/alphacolors.css
	install -D ${pkgname}-${pkgver}/templates/colors $pkgdir/usr/share/docs/${pkgname}/templates/colors
	install -D ${pkgname}-${pkgver}/templates/colors-rgb $pkgdir/usr/share/docs/${pkgname}/templates/colors-rgb
	install -D ${pkgname}-${pkgver}/templates/colors.css $pkgdir/usr/share/docs/${pkgname}/templates/colors.css
	install -D ${pkgname}-${pkgver}/templates/colors.hellwal $pkgdir/usr/share/docs/${pkgname}/templates/colors.hellwal
	install -D ${pkgname}-${pkgver}/templates/colors.json $pkgdir/usr/share/docs/${pkgname}/templates/colors.json
	install -D ${pkgname}-${pkgver}/templates/colors.scss $pkgdir/usr/share/docs/${pkgname}/templates/colors.scss
	install -D ${pkgname}-${pkgver}/templates/colors.vim $pkgdir/usr/share/docs/${pkgname}/templates/colors.vim
	install -D ${pkgname}-${pkgver}/templates/discord-colors.css $pkgdir/usr/share/docs/${pkgname}/templates/discord-colors.css
	install -D ${pkgname}-${pkgver}/templates/dwl-colors-bar.h $pkgdir/usr/share/docs/${pkgname}/templates/dwl-colors-bar.h
	install -D ${pkgname}-${pkgver}/templates/dwl-colors.h $pkgdir/usr/share/docs/${pkgname}/templates/dwl-colors.h
	install -D ${pkgname}-${pkgver}/templates/foot-colors.ini $pkgdir/usr/share/docs/${pkgname}/templates/foot-colors.ini
	install -D ${pkgname}-${pkgver}/templates/fuzzel-colors.ini $pkgdir/usr/share/docs/${pkgname}/templates/fuzzel-colors.ini
	install -D ${pkgname}-${pkgver}/templates/hellwm.lua $pkgdir/usr/share/docs/${pkgname}/templates/hellwm.lua
	install -D ${pkgname}-${pkgver}/templates/hyprland-colors.conf $pkgdir/usr/share/docs/${pkgname}/templates/hyprland-colors.conf
	install -D ${pkgname}-${pkgver}/templates/mako-colors $pkgdir/usr/share/docs/${pkgname}/templates/mako-colors
	install -D ${pkgname}-${pkgver}/templates/rofi.rasi $pkgdir/usr/share/docs/${pkgname}/templates/rofi.rasi
	install -D ${pkgname}-${pkgver}/templates/terminal.sh $pkgdir/usr/share/docs/${pkgname}/templates/terminal.sh
	install -D ${pkgname}-${pkgver}/templates/variables.sh $pkgdir/usr/share/docs/${pkgname}/templates/variables.sh
	install -D ${pkgname}-${pkgver}/templates/variablesfish.fish $pkgdir/usr/share/docs/${pkgname}/templates/variablesfish.fish
	install -D ${pkgname}-${pkgver}/templates/waybar-colors.css $pkgdir/usr/share/docs/${pkgname}/templates/waybar-colors.css
	install -D ${pkgname}-${pkgver}/templates/zathura-colors $pkgdir/usr/share/docs/${pkgname}/templates/zathura-colors
	install -D ${pkgname}-${pkgver}/templates/hellpaper.conf $pkgdir/usr/share/docs/${pkgname}/templates/hellpaper.conf
	install -D ${pkgname}-${pkgver}/templates/kitty-colors.conf $pkgdir/usr/share/docs/${pkgname}/templates/kitty-colors.conf
	install -D ${pkgname}-${pkgver}/templates/qt-colors.conf $pkgdir/usr/share/docs/${pkgname}/templates/qt-colors.conf
	install -D ${pkgname}-${pkgver}/templates/micro-colors.micro $pkgdir/usr/share/docs/${pkgname}/templates/micro-colors.micro
	install -D ${pkgname}-${pkgver}/templates/gtk.css $pkgdir/usr/share/docs/${pkgname}/templates/gtk.css
	install -D ${pkgname}-${pkgver}/templates/niri-colors.kdl $pkgdir/usr/share/docs/${pkgname}/templates/niri-colors.kdl
	install -D ${pkgname}-${pkgver}/templates/hellwal-theme.el $pkgdir/usr/share/docs/${pkgname}/templates/hellwal-theme.el

	# themes
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
