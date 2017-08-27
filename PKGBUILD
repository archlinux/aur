# Maintainer: bao <chibaosen at gmail dot com>

pkgname=raidar
pkgver=6.1
pkgrel=1
pkgdesc="RAIDar is used to discover NETGEAR Storage on your local network."
arch=('i686' 'x86_64')
url="http://kb.netgear.com/20684/ReadyNAS-Downloads"
license=('GPL')
depends=('glibc' 'java-runtime')
source=("http://www.readynas.com/download/RAIDar/raidar_6.1-1.1_amd64.deb")
md5sums=('40cfb3a54629335f319f2fedc9d1accf')

package() {
    tar xf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
