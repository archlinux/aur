# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=splashtop-client
pkgdesc="A client for splashtop."
pkgver=2.6.2.0
pkgrel=2
arch=('i686' 'x86_64')
url="https://www.splashtop.com/linux#download-client"
license=('custom')
source=(https://d17kmd0va0f0mp.cloudfront.net/linuxclient/splashtop-client_1204_2.4.0.1-1_i386.deb)
md5sums=('e775988a7897b70724b5c3a7a188148b')
depends=('apr' 'apr-util' 'bash-completion' 'gcc-libs' 'glibc' 'openssl' 'python2' 'python2-crypto' 'sdl')

package() {
	mkdir data
	tar xf data.tar.gz --directory data/
	cp -r data/* ${pkgdir}
}
