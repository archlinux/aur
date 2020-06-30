#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('pkgbuild-assistant')
pkgver=1.1.0
pkgrel=1
pkgdesc="A PKGBUILD Assistant written by Qt5."
provides=("pkgbuild-assistant")
url='https://github.com/skykeyjoker/PKGBUILD-Assistant'
arch=('x86_64')

depends=('qt5-base' 'harfbuzz' 'graphite')
source=("https://github.com/skykeyjoker/PKGBUILD-Assistant/releases/download/1.1.0/PKGBUILD-Assistant.tar.gz"
)
sha512sums=('ed34b499dbaf8f2ae5c45aa2dde8473c78692b3c8a821a9f873aa21751d7040f08dc7b534ac381eca6a5f66b4e36d03c88b800c360b2b4747840bbd698f62145'
)

package(){
	 install -Dm755 "${srcdir}"/PKGBUILD-Assistant/opt/PKGBUILD-Assistant/PKGBUILD-Assistant "${pkgdir}"/opt/PKGBUILD-Assistant/PKGBUILD-Assistant
	 install -Dm644 "${srcdir}"/PKGBUILD-Assistant/usr/lib/PKGBUILD-Assistant/libstdc++.so.6 "${pkgdir}"/usr/lib/PKGBUILD-Assistant/libstdc++.so.6
	 mkdir -p "${pkgdir}"/usr/share/applications
	 install -Dm644 "${srcdir}"/PKGBUILD-Assistant/usr/share/applications/* "${pkgdir}"/usr/share/applications
	 mkdir -p "${pkgdir}"/usr/share/pixmaps
	 install -Dm644 "${srcdir}"/PKGBUILD-Assistant/usr/share/pixmaps/* "${pkgdir}"/usr/share/pixmaps
	 	 
	 
}
