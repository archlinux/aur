# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=flac2pod
pkgver=3.2
pkgrel=1
pkgdesc='Converts your FLAC library to be iPod-ready'
url='https://github.com/rwinkhart/flac2pod'
arch=('any')
license=('GPL2')
depends=(ffmpeg flac python python-mutagen screen)

source=("https://github.com/rwinkhart/flac2pod/releases/download/v$pkgver/flac2pod-$pkgver.tar.xz")
sha512sums=('fa65667aac8c6ecff5a1eb9e9f525f28312139a538c52ad21f399bcf48751acecf99daf958717626c6e9f26fd2b71b579f44a4f836e0826534bb11e0cb37c04b')

package() {

    tar xf flac2pod-"$pkgver".tar.xz -C "${pkgdir}"

}

