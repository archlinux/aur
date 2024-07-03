pkgname=chromap
_pkgname=chromap
_pkg_ver=0.2.6
pkgver=${_pkgname}_${_pkg_ver}
pkgrel=1
pkgdesc="An ultrafast method for aligning and preprocessing high throughput chromatin profiles. "
arch=('x86_64')
license=('custom:"Copyright (c) 2015 Abner Lee All Rights Reserved."')
url="https://typoraio.cn/"
depends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=()

_file_name=chromap-${_pkg_ver}_x64-linux.tar.bz2
source=(
	"https://gh.api.99988866.xyz/https://github.com/haowenz/chromap/releases/download/${_pkg_ver}/$_file_name"
)
sha512sums=(
	'f25f2c3b8c3a5285478f5a30792f11ae287b644f6ca691696a871dc0c5a8cd529b6e2f54a457d1dbe6486967c7379c5788fde039e5666768e04e799829defe3d'
)

package() {
	export LC_ALL=en_US.UTF-8

	mkdir -p "$pkgdir/usr/bin"
	tar -xf $_file_name -C "$pkgdir/usr/bin"
}
