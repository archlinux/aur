# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=flac2pod
pkgver=2.1
pkgrel=1
pkgdesc='Converts your FLAC library to be iPod-ready'
url='https://github.com/rwinkhart/flac2pod'
arch=('any')
license=('GPL2')
depends=(python ffmpeg lame rg2sc screen python-mutagen)

source=("https://github.com/rwinkhart/flac2pod/releases/download/v$pkgver/flac2pod-$pkgver.tar.xz")
sha512sums=('6b44b303560ddac0470672ef0905c76bba6f09baf69f7d45392453215f0dc4d05ac975902e10935620d7d3acf18858f0685f22dab7c95a36ac433937bdf76672')

package() {

    tar xf flac2pod-"$pkgver".tar.xz -C "${pkgdir}"

}

