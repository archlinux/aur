# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=flac2pod
pkgver=3.4
pkgrel=1
pkgdesc='Converts your FLAC library to be iPod-ready'
url='https://github.com/rwinkhart/flac2pod'
arch=('any')
license=('GPL2')
depends=(ffmpeg flac python python-mutagen python-pillow screen)
source=("https://github.com/rwinkhart/flac2pod/releases/download/v$pkgver/flac2pod-$pkgver.tar.xz")
sha512sums=('c97ab2d50bbec3d064ca93fb58307b58937310670513a2126f6a12fbc555c9cff5380e594c26138cf0bb86bfcfb2bf5ea1c847b32b0750717071f289291e5112')

package() {
    tar xf flac2pod-"$pkgver".tar.xz -C "${pkgdir}"
}

