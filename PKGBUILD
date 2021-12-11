# Maintainer: Benjamin Vialle <archlinux@vialle.io>
# PGP ID: 72DF86FBBBBD5EDAE8FF1834826884A347F9FD9A
# Contributor: puleiya <ninettristan@gmail.com>
pkgname=zedpro
pkgver=2020.4
pkgrel=3
pkgdesc="Zed! Encrypted containers manager"
arch=("i686" "x86_64")
url="http://www.primx.eu"
license=("Prim'X")
depends=("libxslt" "qt5-base" "hicolor-icon-theme" "libldap24")
conflicts=("zedfree")
options=("!strip" "!emptydirs")
install=${pkgname}.install
source_i686=("https://www.zedencrypt.com/file/get/-/item_key/13802-26-7fd209fe")
source_x86_64=("https://www.zedencrypt.com/file/get/-/item_key/13802-25-299e76f8")
sha512sums_i686=("d489a8567dc3417c6a2c13670e3cc6d092efe5eacf19df41ade55c70204a36ad939bd01f0c9a29eeb10793739b8b2b224f39e2ee91039715445031fd9226f21e")
sha512sums_x86_64=("79c4eaeeea9fedea87760191bdf505990257674cae8ce98e923cc9afb057f42cfd6cdbb10e5d751ce864418e3f5dc8f82e5b563689b8d1b893eb27abc9f74e78")

package(){

	# Extract package data
	tar --extract --file data.tar.xz -C "${pkgdir}"

    find "${pkgdir}" -type d -print0 | xargs -0 chmod 755

}
