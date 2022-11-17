# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=flac2pod
pkgver=3.3
pkgrel=1
pkgdesc='Converts your FLAC library to be iPod-ready'
url='https://github.com/rwinkhart/flac2pod'
arch=('any')
license=('GPL2')
depends=(ffmpeg flac python python-mutagen screen)
source=("https://github.com/rwinkhart/flac2pod/releases/download/v$pkgver/flac2pod-$pkgver.tar.xz")
sha512sums=('9fe4dbd8f038084aed2530dc5afd7f7bb171f6c6d8bff4499522f5d932ea2cc948a374c9fb1c211e10ada2e203ba9cf3659737a5cd123dd2245d8114bcec84eb')

package() {
    tar xf flac2pod-"$pkgver".tar.xz -C "${pkgdir}"
}

