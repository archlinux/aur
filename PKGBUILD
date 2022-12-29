# Maintainers: bofil <qccrypt@free.fr>; kusakata <shohei atmark kusakata period com>

pkgname=qccrypt
pkgver=0.9.1
pkgrel=1
pkgdesc='A cross-plateform frontend for ccrypt software'
arch=('i686' 'x86_64')
url="http://qccrypt.free.fr/"
license=('GPL2')
depends=('ccrypt' 'libxcb' 'qt5-base')
source=("http://qccrypt.free.fr/download/qccrypt-${pkgver}-src.zip" "qccrypt.desktop" "x-cpt.xml" "qccrypt.xml" "x-cpt.desktop" "icons.zip")

build() {
	cd "${srcdir}/qccrypt-${pkgver}-src"
	qmake-qt5
	make
}

package() {
	cd "${srcdir}/qccrypt-${pkgver}-src"
	install -Dm755 qccrypt "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 ressources/images/qccrypt.png "${pkgdir}/usr/share/pixmaps/qccrypt.png"
	cd "${srcdir}"
	install -Dm644 qccrypt.desktop "${pkgdir}/usr/share/applications/qccrypt.desktop"
	install -Dm644 x-cpt.xml "${pkgdir}/usr/share/mime/application/x-cpt.xml"
	install -Dm644 qccrypt.xml "${pkgdir}/usr/share/mime/packages/qccrypt.xml"
	install -Dm644 x-cpt.desktop "${pkgdir}/usr/share/mimelnk/application/x-cpt.desktop"
	install -Dm644 icons/hicolor/16x16/apps/qccrypt.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/qccrypt.png"
	install -Dm644 icons/hicolor/16x16/mimetypes/application-x-cpt.png "${pkgdir}/usr/share/icons/hicolor/16x16/mimetypes/application-x-cpt.png"
	install -Dm644 icons/hicolor/24x24/apps/qccrypt.png "${pkgdir}/usr/share/icons/hicolor/24x24/apps/qccrypt.png"
	install -Dm644 icons/hicolor/24x24/mimetypes/application-x-cpt.png "${pkgdir}/usr/share/icons/hicolor/24x24/mimetypes/application-x-cpt.png"
	install -Dm644 icons/hicolor/32x32/apps/qccrypt.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/qccrypt.png"
	install -Dm644 icons/hicolor/32x32/mimetypes/application-x-cpt.png "${pkgdir}/usr/share/icons/hicolor/32x32/mimetypes/application-x-cpt.png"
	install -Dm644 icons/hicolor/48x48/apps/qccrypt.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/qccrypt.png"
	install -Dm644 icons/hicolor/48x48/mimetypes/application-x-cpt.png "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-cpt.png"
	install -Dm644 icons/hicolor/64x64/apps/qccrypt.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/qccrypt.png"
	install -Dm644 icons/hicolor/64x64/mimetypes/application-x-cpt.png "${pkgdir}/usr/share/icons/hicolor/64x64/mimetypes/application-x-cpt.png"
	install -Dm644 icons/hicolor/96x96/apps/qccrypt.png "${pkgdir}/usr/share/icons/hicolor/96x96/apps/qccrypt.png"
	install -Dm644 icons/hicolor/96x96/mimetypes/application-x-cpt.png "${pkgdir}/usr/share/icons/hicolor/96x96/mimetypes/application-x-cpt.png"
	install -Dm644 icons/hicolor/128x128/apps/qccrypt.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/qccrypt.png"
	install -Dm644 icons/hicolor/128x128/mimetypes/application-x-cpt.png "${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes/application-x-cpt.png"
	install -Dm644 icons/hicolor/256x256/apps/qccrypt.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/qccrypt.png"
	install -Dm644 icons/hicolor/256x256/mimetypes/application-x-cpt.png "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/application-x-cpt.png"
}

md5sums=('bff18228e22ce013baf78b52eb153072'
         '1e208212a325a4ed551f5955f4e8c6be'
         'bf60d5c11809910d2a9c98aaa8217911'
         '14af5e3ee3813b1812145cf20defdb70'
         '6390b8d0119570f4d7d2deb7c05b61e8'
         '515543b430023f2b07906a6dd63cb3e5')
