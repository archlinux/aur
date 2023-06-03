pkgname="pynterferometer"
pkgver=2.0
pkgrel=1
pkgdesc="Is a graphical interface designed to demonstrated the techniques of radio interferometry used by telescopes"
arch=("x86_64")
url="https://www.jb.man.ac.uk/pynterferometer/index.html"
license=('unknown')
depends=('tk' 'python2' 'python2-numpy' 'python2-matplotlib' 'python2-scipy')
source=("https://www.jb.man.ac.uk/pynterferometer/Linux/LinuxV2ERIS.tar")
md5sums=('55dd6a740993e098c5aa6bd9b96f491c')

package() {
	install -d "${pkgdir}/opt"
	cp -r "${srcdir}/V2_Eris/" "${pkgdir}/opt/${pkgname}"
}
