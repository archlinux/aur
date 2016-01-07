pkgname=splashtop-client
pkgdesc="A client for splashtop."
pkgver=2.4.0.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.splashtop.com/linux#download-client"
license=('commercial')
source=(http://d17kmd0va0f0mp.cloudfront.net/linuxclient/splashtop-client_1204_2.4.0.1-1_i386.deb)
md5sums=('e775988a7897b70724b5c3a7a188148b')
depends=('apr' 'apr-util' 'bash-completion' 'gcc-libs' 'glibc' 'openssl' 'python' 'python-crypto' 'sdl')
# I got the above dependencies from debtap

package() {
	mkdir data
	tar xf data.tar.xz --directory data/
	cp -r data/* ${pkgdir}
}

# missing deps: 'libavcodec53' 'libavcodec-extra-53' 'libavformat53' 'libavformat-extra-53' 'libavutil51' 'libavutil-extra-51' 'libswscale2' 'libswscale-extra-2'