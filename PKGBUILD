# Maintainer: HFDan <hfdan.aur at gmail dot com>

pkgname="suside-bin"
pkgver=2.3.3
pkgrel=1
#epoch=
pkgdesc="The most sussy text editor"
arch=("x86_64")
url="https://github.com/zeankundev/suside"
license=('MIT')
#groups=()
depends=("appmenu-gtk-module")
#makedepends=()
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("https://github.com/zeankundev/suside/releases/download/${pkgver}/Suside_Installer_${pkgver}_linux_x86_64.rpm" "suside.sh")
#noextract=()
sha512sums=('31df6e5ece10f0833c9f1c87e85281c944398ead4282bd7c4e32f0727b9971028874d0c07b5472a6dcdab2463194beb1226bbae832c36e20d5cb5197acef1381'
            '70e5de8ea5f8850e26f0ba7b06f360a3133e2d658d456e3bd553767a7549efca825c37fd2eecc708ba1e26a71c43068af02fd17d024ece8fc400c65f2d08633f')

package() {
	cp -r ${srcdir}/opt ${pkgdir}
	cp -r ${srcdir}/usr ${pkgdir}
	mkdir ${pkgdir}/usr/bin
	cp ${srcdir}/suside.sh ${pkgdir}/usr/bin/suside
}