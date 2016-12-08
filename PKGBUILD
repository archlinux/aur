# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=timedoctorpro
pkgver=1.4.75.14
urlver=$(echo $pkgver|sed 's/\.\([^.]*\)$/-\1/')
pkgrel=2
arch=('x86_64')
pkgdesc="App to track work time from timedoctor.com"
url="https://www.timedoctor.com/download.html"
license=('proprietary')

#maybe also depends=('libxss')
depends=('libx11' 'libxcb' 'zlib' 'qt4' 'opencv2' 'jasper')

source=("https://updates.timedoctor.com/download/_production/tdpro/linux-ubuntu-16.04/timedoctorpro_${urlver}ubuntu16.04_amd64.deb")
md5sums=('0d50154852f5f10bd8e470066f61a523')

package() {
        cd $pkgdir
        tar -xf $srcdir/data.tar.xz
}
