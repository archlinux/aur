pkgname="whatismyip"
pkgver="1.0.1"
pkgrel="2"
arch=("any")
depends=("curl" "cowsay")
license=("GPL")
source=("whatismyip")
pkgdesc="A bash script getting the public ip of the default route [using AWS]"
md5sums=("55f4c372735e91101fb5baa62b6332cf")
package(){
 mkdir -p ${pkgdir}/usr/bin
 cp ${srcdir}/whatismyip ${pkgdir}/usr/bin
}

