# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=flac2pod
pkgver=3.0
pkgrel=1
pkgdesc='Converts your FLAC library to be iPod-ready'
url='https://github.com/rwinkhart/flac2pod'
arch=('any')
license=('GPL2')
depends=(ffmpeg flac python python-mutagen screen)

source=("https://github.com/rwinkhart/flac2pod/releases/download/v$pkgver/flac2pod-$pkgver.tar.xz")
sha512sums=('66ea7c544f8672fc8641179d07d95fe53097ffb2231f225d09cbb7690f25c8d797091fcba8b47da0e5aba7b09edb7135163190a8498b4019d9e2abef4d784ee6')

package() {

    tar xf flac2pod-"$pkgver".tar.xz -C "${pkgdir}"

}

