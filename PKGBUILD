# Maintainer: sineptic <sineptic0@gmail.com>
pkgsubn=vimium
pkgname=hdrop-git
pkgver=0.4.7.9cd5a1c
pkgrel=1
pkgdesc="Emulate 'tdrop' in Hyprland (run, show and hide programs via keybind - similar to a dropdown terminal)"
url="https://github.com/Schweber/hdrop"
license=('AGPL-3.0')
provides=(hdrop)
arch=('any')
depends=(
	libnotify
	jq
	bash
	awk
	hyprland
)
makedepends=(
	git
	make
)

package() {
	git clone $url
	cd hdrop
	make all && sudo make install
}
