# Maintainer: port19 <port19@port19.xyz>
pkgname=posix-docs
pkgver=1003.1_2017
pkgrel=2
pkgdesc="The Open Group Base Specifications Issue 7, 2018 Edition"
arch=('any')
url="https://pubs.opengroup.org/onlinepubs/9699919799/"
license=('custom:Propietary')
source=("https://pubs.opengroup.org/onlinepubs/9699919799/download/susv4-2018.tar.bz2")
sha256sums=('cf1d41712e4290829ad7205d2faba50f9e6a1ce1d81cc7013ea71da6e13c8e20')
package() {
	cd "$srcdir"
	mkdir -p $pkgdir/usr/share/doc/posix
	cp -a susv4-2018/* $pkgdir/usr/share/doc/posix
}
