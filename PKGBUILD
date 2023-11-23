# Maintainer: sunplan
pkgname=hotdog
pkgver=20230813
pkgrel=1
pkgdesc='X11 Window Manager with Windows 3.1 Hot Dog Stand, Amiga Workbench, Atari ST GEM, Mac Classic and Aqua UI'
arch=('x86_64')
url='https://github.com/arthurchoung/HOTDOG'
license=('GPL3')
depends=(
	'alsa-lib'
	'libglvnd'
	'perl'
)
optdepends=(
	'compton: Aqua mode window drop shadows'
	'feh: Aqua mode wallpaper'
)
source=("https://hotdoglinux.com/download/HOTDOGbuntu_${pkgver}_amd64.deb")
md5sums=('e3e8eb5e1cb03be3aec07bf2b54a328f')
sha256sums=('d3e12d9cafc49b036c5252a7caed23559d671801baefaf295b5a50598f2cb631')

package() {
	tar xf data.tar.xz
	cp -r "${srcdir}/usr" "${pkgdir}/usr"
	cp -r "${srcdir}/etc" "${pkgdir}/etc"
	mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/doc"
}
