pkgname="zenstates-openrc"
pkgver="1.0.0"
pkgrel="1"
arch=("any")
depends=("openrc")
license=("MIT")
source=("https://tilde.club/~xiajo/files/aur/$pkgname/$pkgver/zen.start")
pkgdesc="An openrc script to automatically disable c6 states"
md5sums=("bd1ea88f1b8e2afa502760a77bc8502f")
package(){
 mkdir -p ${pkgdir}/etc/local.d/
 cp ${srcdir}/zen.start ${pkgdir}/etc/local.d/
 chmod +x ${pkgdir}/etc/local.d/zen.start
}

