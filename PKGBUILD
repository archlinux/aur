#! /bin/bash
# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: cros_145<joner14@hotmail.com>

pkgname=bouml
pkgver=6.11.2
pkgrel=1
pkgdesc='A free UML 2 tool box allowing you to specify and generate code in C++, Java, Idl, Php and Python. '
arch=('i686' 'x86_64')
# options=('!strip')
url='http://bouml.fr/'
license=('GPL')
depends=('qt4')
# makedepends=('rpmextract')
source_x86_64=("https://github.com/funilrys/archlinux-bouml-src/archive/v$pkgver-x86_64.tar.gz")
source_i686=("https://github.com/funilrys/archlinux-bouml-src/archive/v$pkgver-i686.tar.gz")
sha512sums_x86_64=('ddb9093d3aa4c5b3e45250e5eaac9aa2c6cee339b7caf4434ee43f7967f71cf2eece1eab6fa6714813135662855e881c2dbde449d6c1c54863e2f8ab10c895ed')
sha512sums_i686=('0cae433f9ca24a5dac8d82dce7695d62a4aa38618b512a73b945d63bb8719475b895ca2191caa96c12df0dc609eca3236fa32b6dc7d2c2d0f7c206b35b44cfa0')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        cp -R $srcdir/archlinux-bouml-src-$pkgver-x86_64/usr/share/usr/bin/* $pkgdir/usr/share/usr/bin/
        cp -R $srcdir/archlinux-bouml-src-$pkgver-x86_64/usr/share/usr/share/applications/* $pkgdir/usr/share/usr/share/applications/
        cp -R $srcdir/archlinux-bouml-src-$pkgver-x86_64/usr/share/usr/share/icons/* $pkgdir/usr/share/usr/share/icons/
        cp -R $srcdir/archlinux-bouml-src-$pkgver-x86_64/usr/lib64/* $pkgdir/usr/lib64/
    else
        cp -R $srcdir/archlinux-bouml-src-$pkgver-i686/usr/share/usr/bin/* $pkgdir/usr/share/usr/bin/
        cp -R $srcdir/archlinux-bouml-src-$pkgver-i686/usr/share/usr/share/applications/* $pkgdir/usr/share/usr/share/applications/
        cp -R $srcdir/archlinux-bouml-src-$pkgver-i686/usr/share/usr/share/icons/* $pkgdir/usr/share/usr/share/icons/
        cp -R $srcdir/archlinux-bouml-src-$pkgver-i686/usr/lib/* $pkgdir/usr/lib/
    fi
}
