# Maintainer: oliver < a t >  first . in-berlin . de

pkgname=eqp
pkgver=09e
pkgrel=3
pkgdesc="Equational Prover (Theorem Prover for First-Order Equational Logic)"
arch=('i686' 'x86_64')
license=('unknown')
source=(https://web.archive.org/web/20161203221638if_/http://www.cs.unm.edu/~mccune/old-ftp/eqp-09e.tar.gz)
depends=('glibc')
md5sums=('2bc1c58566a2db961a1903984ce9f934')
url="http://www.cs.unm.edu/~mccune/eqp/"

build() {
cd ${pkgname}-${pkgver}
make eqp
}

package() {
cd ${pkgname}-${pkgver}
install -Dm 755 eqp09e ${pkgdir}/usr/bin/eqp09e         # install to Arch-Linux path
}
