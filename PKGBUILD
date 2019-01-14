pkgname=naotu
pkgver=3.2.1
pkgrel=2
arch=('x86_64')
license=('GPL2.0')
url='https://github.com/NaoTu/DesktopNaotu'
pkgdesc='simple mind map tool from baidu'
source=("https://github.com/NaoTu/DesktopNaotu/releases/download/v3.2.1-Bata/DesktopNaotu-linux-x64.zip")
sha1sums=('e10168d2b1a5bdae18e480cd95012669fa51cec5')
_fname=DesktopNaotu-linux-x64

package(){
    mkdir -p ${pkgdir}/opt/${pkgname}
	cp -fRr ${_fname}/* ${pkgdir}/opt/${pkgname}

	chmod +=x ${pkgdir}/opt/${pkgname}/DesktopNaotu

	mkdir -p ${pkgdir}/usr/local/bin
	ln -sf /opt/${pkgname}/DesktopNaotu ${pkgdir}/usr/local/bin/naotu
}
