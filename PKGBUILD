# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=smina-bin
pkgver=20191015
pkgrel=1
pkgdesc="Smina is a fork of Autodock Vina that focuses on improving scoring and minimization"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/smina/"
license=('Apache')
source=("https://downloads.sourceforge.net/project/smina/smina.static")
noextract=('smina.static')
md5sums=('76059b4e2c2bf595b914349376d0b900')

package() {
    install -Dm755 ${srcdir}/smina.static ${pkgdir}/usr/bin/smina
}

