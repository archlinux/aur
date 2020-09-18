# Maintainer: Tiago Debastiani <debastianister@gmail.com>

pkgname=brmodelo
pkgver=3.3
pkgrel=1
epoch=
pkgdesc="Ferramenta de Modelagem de Bancos de Dados Relacionais"
arch=('any')
url="http://www.sis4.com/brModelo/index.html"
license=('GPL3')
depends=('java-runtime>=8')
source=("http://www.sis4.com/brModelo/brModelo.jar"
	"icon.png"
	"brModelo.sh"
	"brModelo.desktop")
md5sums=('dd4788e76d95b9effe9bd7c7a3ce051b'
         '0f677c27e3af9f1a9b3ae31d0197176c'
         'eb9be16b05955c3eb81d766156b77d27'
         '3aaad69042db5a54aed691d58f3e8058')

package() {
	cd "${srcdir}"
	install -D -m644 "`find . -name "*.jar"`" "${pkgdir}/opt/brModelo/brModelo.jar"
	install -D -m755 "brModelo.sh" "${pkgdir}/usr/bin/brModelo"
	install -D -m644 "brModelo.desktop" "${pkgdir}/usr/share/applications/brModelo.desktop"
	install -D -m644 "icon.png" "${pkgdir}/usr/share/pixmaps/brModelo.png"
}

