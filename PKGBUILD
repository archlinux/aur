# Maintainer: Runnytu < runnytu at gmail dot com >
 
pkgname=dkms-awdev
pkgver=0.4
pkgrel=1
pkgdesc="Driver for cubieboard flash from LiveSuit"
arch=('i686' 'x86_64')
url="http://dl.cubieboard.org/software/tools/livesuit/"
license=('GPL')
depends=('dkms' 'linux-headers' 'unzip')
install=${pkgname}.install
options=(!strip)
_pkgname="awdev"
source=(https://dl.dropboxusercontent.com/u/59700321/packages_sources/awdev-0.4.tar.gz)
md5sums=('19affcf9b59ffb11b7f3cb2dfb997832')
               

package() {
       
        installDir="$pkgdir/usr/src/$_pkgname-$pkgver"
       
        install -dm755 "$installDir"
	echo "$srcdir/$_pkgname-$pkgver"
        cp -a  "$srcdir/$_pkgname-$pkgver/dkms.conf" "$installDir"
        cp -a  "$srcdir/$_pkgname-$pkgver/Makefile" "$installDir"
        cp -a  "$srcdir/$_pkgname-$pkgver/awusb.c" "$installDir"
       
}
