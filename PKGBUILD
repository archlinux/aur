#Original software from Jukka Isohatala (JI) - PKGBUILD release: José Luis Garrido Labrador (JoseluCross) - Company: JKA Network
pkgname=xbcg
pkgver=0.12
pkgrel=2
pkgdesc="A gamma-contrast-brightness modifier of Linux's laptops"
arch=('any')
license=('GPL2')
#groups=()
depends=('libx11' 'libxxf86vm')
makedepends=()
#backup=()
options=(!emptydirs)
source=(http://mirror.jkanetwork.com/Third-Party/xbcg-0.12.tar.bz2)
md5sums=(9a017edaf817678776f7821cdd718467)

build(){
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package(){
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
