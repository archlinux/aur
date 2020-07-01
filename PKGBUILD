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
sha512sums=('3914477ce9044aa3337fd3a5c18481efac72c8adf25359e67fc7b86981d6ca9595a3a59fdd5925d4dd82091234d576d8d2db9865f222f2fb61f7121259d9a27a'
)

package(){
	 install -Dm755 "${srcdir}"/PKGBUILD-Assistant/opt/PKGBUILD-Assistant/PKGBUILD-Assistant "${pkgdir}"/opt/PKGBUILD-Assistant/PKGBUILD-Assistant
	 install -Dm644 "${srcdir}"/PKGBUILD-Assistant/usr/lib/PKGBUILD-Assistant/libstdc++.so.6 "${pkgdir}"/usr/lib/PKGBUILD-Assistant/libstdc++.so.6
	 mkdir -p "${pkgdir}"/usr/share/applications
	 install -Dm644 "${srcdir}"/PKGBUILD-Assistant/usr/share/applications/* "${pkgdir}"/usr/share/applications
	 mkdir -p "${pkgdir}"/usr/share/pixmaps
	 install -Dm644 "${srcdir}"/PKGBUILD-Assistant/usr/share/pixmaps/* "${pkgdir}"/usr/share/pixmaps
	 	 
	 
}
