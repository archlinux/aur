# Maintainer: Oliver Mader <b52@reaktor42.de>
pkgname=mitk-bin
pkgver=2016.03.0
pkgrel=1
pkgdesc='Medical Imaging Interaction Toolkit (MITK) is a free open-source software system for development of interactive medical image processing software.'
arch=('i686' 'x86_64')
url='http://mitk.org'
license=('BSD3')
depends=('libxnvctrl' 'qt5-tools' 'qt5-webkit')
source=("http://www.mitk.org/download/releases/MITK-2016.03/Linux/MITK-2016.3.0-linux64.tar.gz"
        "MitkWorkbench")
md5sums=('6b039bd788406e0bc7110f544e7c0ebf'
         '016d36443be66647dc371bc8183dab29')

options=(!strip)

package() {
	mkdir "$pkgdir/opt"
	cp -r "$srcdir/MITK-2016.3.0-linux64/bin/" "$pkgdir/opt/MITK-2016.3.0"
	install -D -m 755 "$srcdir/MitkWorkbench" "$pkgdir/usr/bin/MitkWorkbench"
}

