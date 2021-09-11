# Maintainer: wszqkzqk <wszqkzqk@gmail.com>
# Maintainer: luosoy <249799588@qq.com>

pkgname=deepin-udis86
pkgsname=udis86
pkgvers=1.72-4
pkgver=1.72_4
pkgrel=1
epoch=
pkgdesc="Deepin Wine"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
groups=()
depends=()
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('udis86' 'udis86-git' 'mingw-w64-udis86')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://community-packages.deepin.com/deepin/pool/non-free/u/${pkgsname}/${pkgsname}_${pkgvers}_i386.deb")
noextract=("${pkgsname}_${pkgvers}_i386.deb")
md5sums=('806a74d3da003d34340296a985432774')
validpgpkeys=()

prepare() {
	ar -x ${pkgsname}_${pkgvers}_i386.deb
	mkdir ${pkgsname}-${pkgvers}
	tar -xf data.tar.xz --directory="${pkgsname}-${pkgvers}"	
}

package() {
	cd "${pkgsname}-${pkgvers}"
	cp -r ./ ${pkgdir}/
}
