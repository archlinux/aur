pkgname=avwow-git
pkgver=0.1
pkgrel=1
pkgdesc="a powwow theme pack for avalon MUD"
arch=(any)
license=('GPL3')
url='https://github.com/chrys87/avwow/tree/master/avwow'
source=('git+https://github.com/chrys87/avwow.git')
depends=('powwow')
makedepends=('git')
install='avwow-git.install'
provides=('avwow')
conflicts=('avwow')
md5sums=('SKIP')
    
package() {
  cd "${srcdir}/avwow"
  mkdir -p "$pkgdir/opt/"
  cp -r avwow "$pkgdir/opt/"
}
