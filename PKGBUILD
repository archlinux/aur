pkgname=sph-web-publish-git
pkgver=30
pkgrel=1
pkgdesc="static site generator"
arch=(any)
license=(gpl3+)
makedepends=(git)
depends=(guile guile-commonmark sph-lib)
optdepends=(rsync graphicsmagick)
provides=(sph-web-publish)
conflicts=(sph-web-publish)
source=("git://git.sph.mn/sph-web-publish")
url="http://sph.mn"
md5sums=(SKIP)

pkgver() {
  cd sph-web-publish
  git rev-list --count HEAD
}

package() {
  cd sph-web-publish
  ./exe/install "${pkgdir}"
}