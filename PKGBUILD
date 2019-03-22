# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=smina-bin
pkgver=20190212
pkgrel=1
pkgdesc="Smina is a fork of Autodock Vina that focuses on improving scoring and minimization"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/smina/"
license=('Apache')
source=("https://downloads.sourceforge.net/project/smina/smina.static")
noextract=('smina.static')
md5sums=('6320e3638df260907d190e160b8c9ac8')

package() {
    install -Dm755 ${srcdir}/smina.static ${pkgdir}/usr/bin/smina
}

