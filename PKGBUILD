# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=openbox-theme-surreal
pkgver=20070916
pkgrel=1
pkgdesc="A dark gray theme for Openbox."
arch=(
	"any"
)
url="http://box-look.org/content/show.php?content=66397"
license=(
	"GPL"
)

depends=(
	"openbox"
)
optdepends=()
makedepends=()
provides=(
	"${pkgname}=${pkgver}"
)
conflicts=(
	"${pkgname}"
)
replaces=(
	"${pkgname}"
)

# Mirror
# https://www.dropbox.com/s/k9k98zsrcjw7ue7/66397-Surreal.tar.bz2
source=(
	"http://box-look.org/CONTENT/content-files/66397-Surreal.tar.bz2"
)
sha384sums=(
	"feef8c585b65838cb5426bb7cd9ffb83d80218669ee74be775bb79b920811263ae4262153397b998ab569dd8dc61c13a"
)
sha512sums=(
	"7f8170f2296ceb47864fe7cd589e3807aa28be7d0d0dc1925a95641f0c78b8c3c265b6874e41559f8048f2ee1abfcd1c92031869172462719820919a810c63a8"
)

package() {	
	# Copy theme
	mkdir -p ${pkgdir}/usr/share/themes
	cp -R ${srcdir}/Surreal ${pkgdir}/usr/share/themes
}