#! /bin/bash
# aintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: cros_145<joner14@hotmail.com>

pkgname=bouml
pkgver=6.11.2
pkgrel=1
pkgdesc='A free UML 2 tool box allowing you to specify and generate code in C++, Java, Idl, Php and Python. '
arch=('i686' 'x86_64')
options=('!strip')
url='http://bouml.fr/'
license=('GPL')
depends=('qt4')
makedepends=('rpmextract')
source=("http://$pkgname.fr/files/$pkgname-$pkgver-CentOS6.$CARCH.rpm")

if [ "$CARCH" = "x86_64" ]; then
    sha512sums=('050a00253a96ba62bef334a24a160a1bb3dffd7014e2dcf3d5bfd163f3f5fbc8f3371849696dabbe4e076e3eaa0d06c3bfb1475325edffdbf7a695811266f7ae')
else
    sha512sums=('663ed5fe6c27e7160a723cdbb99255144dd4cef4a28c4fcccc166a6ca484628c9884b0daa2f85713d226d7a11f05898ca884904b94537e099275d4378d5d9b6f')
fi

package() {
        cd $pkgdir
	rpmextract.sh $srcdir/$pkgname-$pkgver-CentOS6.$CARCH.rpm
}
