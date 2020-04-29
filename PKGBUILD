# Maintainer: Tiago Debastiani <debastianister@gmail.com>

pkgname=brmodelo
pkgver=3.2
pkgrel=1
epoch=
pkgdesc="Ferramenta de Modelagem de Bancos de Dados Relacionais"
arch=('any')
url="http://www.sis4.com/brModelo/index.html"
license=('GPL3')
depends=('java-runtime>=8')
source=("http://www.sis4.com/brModelo/brModelo.jar"
	"icon.png"
	"brModelo.desktop")
md5sums=('19943634ac4ec7473db1152cda862422'
         '0f677c27e3af9f1a9b3ae31d0197176c'
         'c9708190fd184f01a5df426d3c4836f3')

package() {
	cd "${srcdir}"
	install -D -m644 "`find . -name "*.jar"`" "${pkgdir}/opt/brModelo/brModelo.jar"
	install -D -m644 "brModelo.desktop" "${pkgdir}/usr/share/applications/brModelo.desktop"
	install -D -m644 "icon.png" "${pkgdir}/usr/share/pixmaps/brModelo.png"
}

