pkgname=dockerize
pkgver=0.6.1
pkgrel=1
pkgdesc='Utility to simplify running applications in Docker containers.'
arch=('x86_64')
url='https://github.com/jwilder/dockerize'
license=('MIT')
source=("https://github.com/jwilder/dockerize/releases/download/v${pkgver}/${pkgname}-linux-amd64-v${pkgver}.tar.gz")
md5sums=('5c1b3d9a7d9341e23e0b8bdf2a288387')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install -D -m0755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/
}
