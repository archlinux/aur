_name=sph-web-publish
pkgname=$_name-git
pkgver=42
pkgrel=1
pkgdesc="static site generator"
arch=(any)
license=(gpl3+)
makedepends=(git)
depends=(guile guile-commonmark sph-lib)
optdepends=(rsync graphicsmagick)
provides=($_name)
conflicts=($_name)
source=("git://git.sph.mn/$_name")
url="http://sph.mn"
md5sums=(SKIP)

pkgver() {
  cd $_name
  git rev-list --count HEAD
}

package() {
  cd $_name
  ./exe/install "$pkgdir"
}