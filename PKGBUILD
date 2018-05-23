# Maintainer: Alfonso Saaverda "Son Link" <sonlink.dourden@gmail.com>

pkgname=imgau2vid
pkgver=1.0.0
pkgrel=0
pkgdesc="Bash script to convert a image with a audio to video using FFMPEG"
arch=('i686' 'x86_64')
url='https://github.com/son-link/imgau2vid/'
license=('GPLv3')
depends=('ffmpeg')

source=("https://github.com/son-link/imgau2vid/archive/${pkgver}.tar.gz")
md5sums=('735b84f7848263274d41557f6499fb96')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p ${pkgdir}/usr/bin
	cp imgau2vid.sh ${pkgdir}/usr/bin
	chmod 755 ${pkgdir}/usr/bin/imgau2vid.sh
	mkdir -p ${pkgdir}/usr/share/applications/
	install -m 644 "${pkgname}-zenity.desktop" ${pkgdir}/usr/share/applications
	install -m 644 "${pkgname}-kdialog.desktop" ${pkgdir}/usr/share/applications
}
