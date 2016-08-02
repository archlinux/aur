# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=timedoctorpro
pkgver=1.4.75
pkgrel=1
arch=('x86_64')
pkgdesc="App to track work time from timedoctor.com"
url="https://www.timedoctor.com/download.html"
license=('proprietary')

#maybe also depends=('libxss')
depends=('libx11' 'libxcb' 'zlib' 'qt4' 'opencv2')

source=("https://updates.timedoctor.com/download/_production/tdpro/linux-ubuntu-16.04/timedoctorpro_${pkgver}-11ubuntu16.04_amd64.deb")
md5sums=('44b2956232541e6a72b97a410cf7b8d6')

package() {
        cd $pkgdir
        tar -xf $srcdir/data.tar.xz
}
