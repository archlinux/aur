# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ben <contrasutra@myrealbox.com>

pkgname=xfce4-artwork
pkgver=0.1.1a_git20110420
_debian_pkgver=0.1.1a~git+20110420
pkgrel=5
pkgdesc="Backdrops for the Xfce4 desktop"
arch=('any')
url="http://goodies.xfce.org/projects/artwork/xfce4-artwork"
license=('GPL2')
groups=('xfce4-goodies')
source=(http://ftp.debian.org/debian/pool/main/x/$pkgname/${pkgname}_$_debian_pkgver.orig.tar.gz)
sha256sums=('7a97c0acd0ed67ebb871866cc79c2925bea45bf1b92442bd88fac390dbe639ac')

build() {
  cd "$srcdir/$pkgname-0.1.1a"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-0.1.1a"
  make backdropsdir="$pkgdir/usr/share/backgrounds/xfce" install
}

# vim:set ts=2 sw=2 et:
