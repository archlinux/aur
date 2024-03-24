# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=flac2pod
pkgver=4.0
pkgrel=1
pkgdesc='Converts your FLAC library to be iPod-ready'
url='https://github.com/rwinkhart/flac2pod'
arch=('any')
license=('GPL2')
depends=(ffmpeg flac python python-mutagen python-pillow)
source=("https://github.com/rwinkhart/flac2pod/releases/download/v$pkgver/flac2pod-$pkgver.tar.xz")
sha512sums=('6a80f97ab099a71c84822ab063d8a6e140fde6cc2c0015c91ecde2a03ad99a5aa89894cd58b8cf17ce602fa8e4c37632d0e53651f4f56698e4e887c18a17ca18')

package() {
    tar xf flac2pod-"$pkgver".tar.xz -C "${pkgdir}"
}

