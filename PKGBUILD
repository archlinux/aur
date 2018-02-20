# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=smina-bin
pkgver=20171109
pkgrel=1
pkgdesc="Smina is a fork of Autodock Vina that focuses on improving scoring and minimization"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/smina/"
license=('Apache')
source=("https://downloads.sourceforge.net/project/smina/smina.static")
noextract=('smina.static')
md5sums=('2c36acc7c512a800640012355ea791bc')

package() {
    install -Dm755 ${srcdir}/smina.static ${pkgdir}/usr/bin/smina
}

