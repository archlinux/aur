# Maintainer : Gabe Gordon gabegordon123@gmail.com
pkgname=parsec
pkgver=1.3.1.1
pkgrel=1
url=http://parsec.tv
arch=('x86_64')
depends=('glibc' 'sndio-git')
source=("https://s3.amazonaws.com/parsec-build/package/parsec-linux.deb")
package() {
    ar p parsec-linux.deb src/data.tar.xz | tar xJ
    install -D ${srcdir}/usr/bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
md5sums=('90bdb99d37650bf3c82b4a521447cf3f')
