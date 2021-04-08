# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=rofi-rbw
pkgver=0.3.0
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
sha256sums=('fa66a726ec225a1026466fa855a477eb471ef85c40b2cb87cdbfad947543aae7')

package() {
	pip install --root=$pkgdir rofi_rbw-${pkgver}-py3-none-any.whl 
}
