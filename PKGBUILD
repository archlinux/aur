# Maintainer: tioguda <tioguda@gmail.com>
# Contributor: McLenin <mclenin at gooogles email>

_pkgname=libstdc++296
pkgname=libstdc++296-bin
pkgver=2.96.126
pkgrel=1
pkgdesc="Standard C++ libraries for Red Hat 7.3 backwards compatibility compiler. With additions from OpenSUSE 13.1. Provides libstdc++-libc6.2-2.so.3"
arch=("x86_64")
url="https://opensuse.pkgs.org/42.3/opensuse-oss/compat-32bit-2010.1.31-4.3.x86_64.rpm.html"
license=('GPL')
makedepends=('rpmextract')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("libstdc++296.rpm::http://widehat.opensuse.org/opensuse/distribution/leap/42.3/repo/oss/suse/x86_64/compat-32bit-2010.1.31-4.3.x86_64.rpm")
noextract=()
md5sums=('a1680572901cc6c4a5346bf26297afdf')

package() {
  cd "$pkgdir"
  rpmextract.sh "$srcdir"/"$_pkgname".rpm
}
