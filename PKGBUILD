# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=flac2pod
pkgver=3.1
pkgrel=1
pkgdesc='Converts your FLAC library to be iPod-ready'
url='https://github.com/rwinkhart/flac2pod'
arch=('any')
license=('GPL2')
depends=(ffmpeg flac python python-mutagen screen)

source=("https://github.com/rwinkhart/flac2pod/releases/download/v$pkgver/flac2pod-$pkgver.tar.xz")
sha512sums=('c73fa933cadd1d9b6dbc475657e3cc537244839bdf87b7dff5f176d8eecc425f1c1a0dd67dd5953bacd4c31cd13da5b7869a1330cda47b655c0830b3a9f4a41f')

package() {

    tar xf flac2pod-"$pkgver".tar.xz -C "${pkgdir}"

}

