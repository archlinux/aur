# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=timedoctorpro
pkgver=1.4.74.11
pkgrel=1
arch=('x86_64')
pkgdesc="App to track work time from timedoctor.com"
url="https://www.timedoctor.com/download.html"
license=('proprietary')

#maybe also depends=('libxss')
depends=('libx11' 'libxcb' 'zlib' 'qt4' 'opencv2')

source=('https://updates.timedoctor.com/download/_production/tdpro/linux-ubuntu-16.04/timedoctorpro_1.4.74-11ubuntu16.04_amd64.deb')
md5sums=('2883fbcf495d9657a9fa8c9c64595b1b')

package() {
        cd $pkgdir
        tar -xf $srcdir/data.tar.xz
}
