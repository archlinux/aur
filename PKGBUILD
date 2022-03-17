pkgname="whatismyip"
pkgver="1.0.2"
pkgrel="1"
arch=("any")
depends=("curl" "cowsay")
license=("GPL")
source=("https://tilde.club/~xiajo/files/aur/whatismyip/$pkgver/whatismyip")
pkgdesc="A bash script getting the public ip of the default route [using AWS]"
md5sums=("55f4c372735e91101fb5baa62b6332cf")
package(){
 mkdir -p ${pkgdir}/usr/bin
 cp ${srcdir}/whatismyip ${pkgdir}/usr/bin
 chmod +x ${pkgdir}/usr/bin/whatismyip
}

