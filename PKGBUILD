# Maintainer: rapiertg <rapiertg@gmail.com>
pkgname=libjssc-java
pkgver=2.8.0
pkgrel=1
pkgdesc="Library for working with serial ports from Java"
arch=('x86_64')
url="https://github.com/scream3r/java-simple-serial-connector"
license=('LGPL')
depends=('glibc')
provides=('libjssc-java')
md5sums=("c6b88df9c071e88787acace8a9284f72")

source=("http://ftp.debian.org/debian/pool/main/j/jssc/${pkgname}_${pkgver}-1_amd64.deb")

package() {
	bsdtar xvf "$srcdir/data.tar.xz" -C "$pkgdir"
}
