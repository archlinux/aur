# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=rofi-rbw
pkgver=0.2.0
pkgrel=1
license=("MIT")
pkgdesc="Rofi frontend for Bitwarden"
url="https://github.com/fdw/rofi-rbw"
makedepends=("python-pip" "python-configargparse")
depends=("python" "rbw")
optdepends=("xdotool: for autofill on X11"
			"wtype: for autofill on Wayland")
arch=('any')
source=("https://github.com/fdw/rofi-rbw/releases/download/${pkgver}/rofi_rbw-${pkgver}-py3-none-any.whl")
sha256sums=("1a715d47a0f774c037b0377141addf6a574ca649a190cac59afa938bdffa9d33")

package() {
	pip install --root=$pkgdir rofi_rbw-${pkgver}-py3-none-any.whl 
}
