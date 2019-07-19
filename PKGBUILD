# Maintainer: Elrondo46

pkgname=coolcv_bin
pkgver=0.6.6
pkgrel=1
pkgdesc="CoolCV emulator (binary version)"
arch=('x86_64')
license=('custom')
url="http://www.colecovision.ca/coolcv.php"
depends=('sdl' 'sdl2')
source=("coolcv_linux_0.6.6_bin.tar.gz")
sha256sums=('ebe902686cbb57730fb2390cb38508fff2185212f0431cb193e77804f57f6042')

package() {
	bsdtar xf coolcv_linux_0.6.6_bin.tar.gz
	chmod -R g-w usr
	mv usr "${pkgdir}"
} 
