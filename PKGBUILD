# Maintainer: HFDan <hfdan.aur at gmail dot com>

pkgname="suside-bin"
pkgver=2.3.3.1
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
source=("https://github.com/zeankundev/suside/releases/download/${pkgver}/Suside_Installer_${pkgver:0:${#pkgver}-2}_linux_x86_64.rpm" "suside.sh")
#noextract=()
sha512sums=('7624fed9c77048b3adafb799b3f5f5af949f0a4a8cd3bd1be179a9a48626946ad65fad68bc915e1089328487707ea33ea2229c791931d151f9fffcbe1d5e5ad1'
            '70e5de8ea5f8850e26f0ba7b06f360a3133e2d658d456e3bd553767a7549efca825c37fd2eecc708ba1e26a71c43068af02fd17d024ece8fc400c65f2d08633f')

package() {
	cp -r ${srcdir}/opt ${pkgdir}
	cp -r ${srcdir}/usr ${pkgdir}
	mkdir ${pkgdir}/usr/bin
	cp ${srcdir}/suside.sh ${pkgdir}/usr/bin/suside
}