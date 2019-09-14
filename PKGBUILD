# Maintainer: Elrondo46

pkgname=coolcv_bin
pkgver=0.6.6
pkgrel=2
pkgdesc="CoolCV emulator (binary version)"
arch=('x86_64')
license=('custom')
url="http://www.colecovision.ca"
depends=('sdl' 'sdl2')
source=("http://www.colecovision.ca/downloads/coolcv_v0.6.2_all.zip")
sha256sums=('SKIP')

package() {
    install -Dm644 "${srcdir}/coolcv_x86_64" "${pkgdir}/usr/bin/coolcv_x86_64"
    install -Dm644 "${srcdir}/coolcv.txt" "${pkgdir}/usr/share/doc/coolcv/coolcv.txt"	
} 
