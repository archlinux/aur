# Maintainer: Joao Pedro (joaopedroaats) <joaopedroaats@pm.me>

pkgname=plank-theme-azeny
pkgver=1.0.0
pkgrel=1
pkgdesc='Azeny theme for Plank'
arch=('any')
url='https://github.com/joaopedroaats/azeny-plank'
license=('MIT')
depends=('plank')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/joaopedroaats/azeny-plank/archive/v${pkgver}.tar.gz")

# makepkg -g >> PKGBUILD && makepkg
md5sums=('d64bedeb3ed4e7933cc7c3fb189cf81e')


build() {
	true
}

package() {
	cd "$srcdir/azeny-plank-$pkgver"

	mkdir -p ~/.local/share/plank/themes/Azeny
	install -m 755 dock.theme ~/.local/share/plank/themes/Azeny
}

