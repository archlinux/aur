pkgname="zenstates-openrc"
pkgver="1.0.0"
pkgrel="1"
arch=("any")
depends=("openrc")
license=("MIT")
source=("https://tilde.club/~xiajo/files/aur/$pkgname/$pkgver/zen.start" "https://tilde.club/~xiajo/files/aur/$pkgname/$pkgver/zenstates.py")
pkgdesc="An openrc script to automatically disable c6 states"
md5sums=("bd1ea88f1b8e2afa502760a77bc8502f" "7bcefe209016716473f37a48b014f3d1")
package(){
 mkdir -p ${pkgdir}/etc/local.d/
 mkdir -p ${pkgdir}/usr/local/bin
 cp ${srcdir}/zen.start ${pkgdir}/etc/local.d/
 cp ${srcdir}/zenstates.py ${pkgdir}/usr/local/bin
 chmod +x ${pkgdir}/etc/local.d/zen.start
 chmod +x ${pkgdir}/usr/local/bin/zenstates.py
}

