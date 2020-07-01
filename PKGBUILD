#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('pkgbuild-assistant')
pkgver=2.1.0
pkgrel=1
pkgdesc="A PKGBUILD Assistant written in Qt5."
provides=("pkgbuild-assistant")
url='https://github.com/skykeyjoker/PKGBUILD-Assistant'
arch=('x86_64')

depends=('qt5-base' 'harfbuzz' 'graphite' 'tree' 'pacman-contrib')
source=("https://github.com/skykeyjoker/PKGBUILD-Assistant/releases/download/2.1.0/PKGBUILD-Assistant.tar.gz"
)
sha512sums=('868713887271a40028666c91833128d9f3be7c4b378d8d4a865b15ed359b05ca53236c37c75c256831834d1938dedb7dbe152f1a65fce5b1be55c5416d0a201a'
)

package(){
	 install -Dm755 "${srcdir}"/PKGBUILD-Assistant/opt/PKGBUILD-Assistant/PKGBUILD-Assistant "${pkgdir}"/opt/PKGBUILD-Assistant/PKGBUILD-Assistant
	 install -Dm644 "${srcdir}"/PKGBUILD-Assistant/usr/lib/PKGBUILD-Assistant/libstdc++.so.6 "${pkgdir}"/usr/lib/PKGBUILD-Assistant/libstdc++.so.6
	 mkdir -p "${pkgdir}"/usr/share/applications
	 install -Dm644 "${srcdir}"/PKGBUILD-Assistant/usr/share/applications/* "${pkgdir}"/usr/share/applications
	 mkdir -p "${pkgdir}"/usr/share/pixmaps
	 install -Dm644 "${srcdir}"/PKGBUILD-Assistant/usr/share/pixmaps/* "${pkgdir}"/usr/share/pixmaps
	 	 
	 
}
