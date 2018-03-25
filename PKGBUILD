# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: McLenin <mclenin at gooogles email>
pkgname=libstdc++296
pkgver=2.96.126
pkgrel=4
pkgdesc="Standard C++ libraries for Red Hat 7.3 backwards compatibility compiler. With additions from OpenSUSE 13.1. Provides libstdc++-libc6.2-2.so.3"
arch=("x86_64")
url="http://rpmfind.net"
license=('GPL')
groups=()
depends=()
makedepends=('rpmextract')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("libstdc++296.rpm::http://rpmfind.net/linux/opensuse/distribution/openSUSE-stable/repo/oss/suse/x86_64/compat-32bit-2010.1.31-4.3.x86_64.rpm")
noextract=()


package() {
  cd "$pckgdir"
  rpmextract.sh "$srcdir"/"$pkgname".rpm
}

md5sums=('a1680572901cc6c4a5346bf26297afdf')
