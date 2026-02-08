pkgname=gamescope-session-opengamepadui
pkgver=r24.88087a0
pkgrel=1
pkgdesc="OpenGamepadUI Gamescope session"
arch=('any')
url="https://github.com/OpenGamingCollective/gamescope-session-opengamepadui"
makedepends=('git')
source=("git+https://github.com/OpenGamingCollective/gamescope-session-opengamepadui.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"
  cp -rv ${srcdir}/${pkgname}/usr ${pkgdir}/usr
}
