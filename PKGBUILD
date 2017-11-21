# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=medleytext
pkgver=0.9.11
pkgrel=4
pkgdesc="Take Better Dev Notes"
arch=('x86_64')
url="https://medleytext.net/"
license=('unknown')
source=("https://s3.amazonaws.com/medleytext/releases/medley-latest.AppImage"
		"medleytext.desktop"
		"medleytext.png")
md5sums=('75ecf9082ad34755f1e98afca8e2eecc'
         '72c9137f873a77eda660bfd7c946ab66'
         '9ecf66c64ddfb7e025667c4953028efd')

package() {
    mkdir -p ${pkgdir}/usr/share/pixmaps/
    mkdir -p ${pkgdir}/usr/share/applications/
    mkdir -p ${pkgdir}/usr/local/bin/
    install -m 644 medleytext.png ${pkgdir}/usr/share/pixmaps/medleytext.png
    install -m 644 medleytext.desktop ${pkgdir}/usr/share/applications/medleytext.desktop
    cp medley-latest.AppImage ${pkgdir}/usr/local/bin/${pkgname}
	chmod +x ${pkgdir}/usr/local/bin/${pkgname}
}
