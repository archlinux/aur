#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: cros_145<joner14@hotmail.com>

pkgname=bouml
pkgver=6.8.1
pkgrel=1
pkgdesc='A free UML 2 modeler with C++, Idl, Java, PHP and Python code generation'
arch=('i686' 'x86_64')
options=('!strip')
url='http://bouml.fr/'
license=('GPL')
depends=('qt4')
makedepends=('rpmextract')
source=("http://$pkgname.free.fr/files/$pkgname-$pkgver-CentOS6.$CARCH.rpm")

if [ "$CARCH" = "x86_64" ]; then

sha512sums=('c1b99d6ee1c3741a5676434bfe42af2a30a0e1352476d337e9a7d6d91ded4e956817031f01ad3dcb3537bacbfa86cb612be984f95678ab203ae7456f95b7c433')

else

sha512sums=('9105e732d160454a88a3b7f2c8810dfcb886038b8a79f6983a75921dc25a39f489ca8c350861747cb80284a409ec9ddb5e444b67966d9dcd45149bfd2eb94df9')

fi


package() {
        cd $pkgdir
	rpmextract.sh $srcdir/$pkgname-$pkgver-CentOS6.$CARCH.rpm
}
