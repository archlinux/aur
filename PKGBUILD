# Maintainer: tyrolyean <tyrolyean@tyrolyean.net>
# Co-Maintainer: danihek <danihek07@gmail.com>
pkgname=hellwal
pkgver=1.0.5
pkgrel=1
pkgdesc="fast, extensible color palette generator"
arch=('i686' 'x86_64' 'arm' 'aarch64' 'riscv')
url="https://github.com/danihek/hellwal"
license=('MIT')
makedepends=('make')
source=(
	"https://github.com/danihek/${pkgname}/archive/refs/tags/v${pkgver}/v${pkgver}.tar.gz"
	)

md5sums=('c4e0412002b82e5946823d8386fdb1f3')
sha256sums=('ad5bd1e4ec7fc747179b4e20e655c1857f3da80c56ce3f82de835aa73550a7a4')
sha512sums=('b2906b232343452cd7fdfe6dee8d78a874aef5d63013b8baa0032e47dbdda0d93f145ce04671b2a11cc3c1763863ec728e944fbe8c4f56333374c23d0b1c7df5')


build() {
	cd ${pkgname}-${pkgver}
	make ${pkgname}
}

package() {
	# pkg
	install -D ${pkgname}-${pkgver}/${pkgname} $pkgdir/usr/bin/${pkgname}

	# bash completion
	install -D ${pkgname}-${pkgver}/assets/hellwal-completion.bash $pkgdir/usr/share/bash-completion/completions/${pkgname}

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
