# Contributor: boteium
pkgname=rtlsdr-waterfall
pkgver=7b424fa2b8
pkgrel=1
pkgdesc="rtlsdr spectrum plot / Python FFT GUI for Realtek RTL2832U based SDR's"
depends=('python2' 'python2-pyglet' 'python2-pyrtlsdr-git')
arch=('any')
install=
url="https://github.com/keenerd/rtlsdr-waterfall"
license=('GPLv3')
provides=('pyrtlsdr' 'python2-pyrtlsdr')
source=(https://codeload.github.com/keenerd/rtlsdr-waterfall/zip/master)
md5sums=()

build(){
	cd "${srcdir}"
	chmod +x ./rtlsdr-waterfall-master/*.py	
}
package(){
	cd "${srcdir}"
	mkdir -p $pkgdir/usr/bin/
	mv ./rtlsdr-waterfall-master/*.py $pkgdir/usr/bin/
}
md5sums=('e5bbd9318358701dae12812e5aa1603e')
