# Maintainer: Versua7 <versua7@gmail.com>

pkgname='irssi-scripts-debian'
pkgver=20220704
pkgrel=3
pkgdir='${pkgname}'
pkgsrc='src/$pkgname'
pkgdesc="This is a collection of debian scripts for the irssi IRC-client"
arch=('x86_64')
license=('Several')
url="https://packages.debian.org/bookworm/irssi-scripts"
depends=('irssi' 'perl' 'sensible-utils' 'perl-libwww')
optdepends=('net-tools')
source=("irssi-scripts_20220704_all.deb::http://ftp.de.debian.org/debian/pool/main/i/irssi-scripts/irssi-scripts_20220704_all.deb")
sha256sums=('409ba3f314fee882b5f31a80d6bcac184c70ee8056198363195608aed5b96a20')

package (){
    bsdtar -xf data.tar.xz
    rm -Rf usr/share/lintian/
    cp -RPp usr/ ../pkg/${pkgname}/
}
