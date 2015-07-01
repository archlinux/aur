# Contributor: Jed Liu <jed-archlinux@uma.litech.org>
pkgname=tmpreaper
pkgver=1.6.13+nmu1
pkgrel=3
pkgdesc="Cleans up files in directories based on their age"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/tmpreaper"
license=('GPL2')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://ftp.de.debian.org/debian/pool/main/t/tmpreaper/${pkgname}_${pkgver}.tar.gz)
noextract=()
md5sums=('36bffb38fbdd28b9de8af229faabf5fe')
sha1sums=('96a490a9c2df6d3726af8df299e5aedd7d49fbfe')
sha256sums=('c88f05b5d995b9544edb7aaf36ac5ce55c6fac2a4c21444e5dba655ad310b738')
sha384sums=('6468fe9a1d165c7235695b08f266ec0e92fcadf60ec9e4d7b2c3fb242df1141be58960ed5c81d80643d8690f9c876ac7')
sha512sums=('c868d421a7757a47b81c8932743981ded2b415c83377f8781fdfd4dfda48c701991da17fa262dfa0680b2a315d6b46ee4c9035ba4c06f5a0c1bc32efa717f19f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
