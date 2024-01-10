# Maintainer: Jonas Kalsvik <jonaskalsvik@gmail.com>
pkgname="epicmickeylauncher"
pkgver="0.3.8"
pkgrel=1
epoch=
pkgdesc="Mod Installer, Level Loader & Launcher for every Epic Mickey game."
arch=('x86_64')
url="https://eml.memerdev.com"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("package::https://github.com/KjubDusJub/Epic-Mickey-Launcher/releases/download/${pkgver}/epic-mickey-launcher_${pkgver}_amd64.deb")
noextract=()
md5sums=("SKIP")
validpgpkeys=()


prepare(){
 tar -zxvf data.tar.gz
}



package() {
	cd ${srcdir}
	install -Dm755 "usr/bin/epic-mickey-launcher" "${pkgdir}/usr/bin/epic-mickey-launcher"
	install -Dm755 "usr/share/applications/epic-mickey-launcher.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	# disabling this until 0.3.9
	# cp -r "${srcdir}/usr/share/icons/" "${pkgdir}/usr/share/icons/"
}
