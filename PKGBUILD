#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('pkgbuild-assistant')
pkgver=2.0.0
pkgrel=1
pkgdesc="A PKGBUILD Assistant written in Qt5."
provides=("pkgbuild-assistant")
url='https://github.com/skykeyjoker/PKGBUILD-Assistant'
arch=('x86_64')

depends=('qt5-base' 'harfbuzz' 'graphite' 'tree' 'pacman-contrib')
source=("https://github.com/skykeyjoker/PKGBUILD-Assistant/releases/download/2.0.0/PKGBUILD-Assistant.tar.gz"
)
sha512sums=('f9c669e1b0d9170943d36fcb6b1d877276e8ffbf66188ad482fdc39acea1967abefe8f923e142a9db41f8a0f9aae9f494bf3fd48e3347eaea8d96277747abc5f'
)

package(){
	 install -Dm755 "${srcdir}"/PKGBUILD-Assistant/opt/PKGBUILD-Assistant/PKGBUILD-Assistant "${pkgdir}"/opt/PKGBUILD-Assistant/PKGBUILD-Assistant
	 install -Dm644 "${srcdir}"/PKGBUILD-Assistant/usr/lib/PKGBUILD-Assistant/libstdc++.so.6 "${pkgdir}"/usr/lib/PKGBUILD-Assistant/libstdc++.so.6
	 mkdir -p "${pkgdir}"/usr/share/applications
	 install -Dm644 "${srcdir}"/PKGBUILD-Assistant/usr/share/applications/* "${pkgdir}"/usr/share/applications
	 mkdir -p "${pkgdir}"/usr/share/pixmaps
	 install -Dm644 "${srcdir}"/PKGBUILD-Assistant/usr/share/pixmaps/* "${pkgdir}"/usr/share/pixmaps
	 	 
	 
}
