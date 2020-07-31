# Maintainer: Alexander Goussas <agoussas@espol.edu.ec>
pkgname='st-aloussase'
pkgver=0.8.2.r12.1946267
pkgrel=1
pkgdesc="aloussase's build of suckless' terminal"
arch=(x86_64 i686)
url="https://github.com/aloussase/st-aloussase.git"
license=('MIT')
depends=(ttf-fira-code terminus-font)
makedepends=(git)
provides=(st)
conflicts=(st)
source=("git+$url")
md5sums=('SKIP')

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
