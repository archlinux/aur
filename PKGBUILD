pkgname=gamescope-session-ogui-steam-git
_gitdir=gamescope-session-ogui-steam
pkgver=r1.6835776
pkgrel=1
pkgdesc="Gamescope session for steam + OpenGamepadUI Overlay"
arch=('any')
url="https://github.com/OpenGamingCollective/${_gitdir}"
makedepends=('git')
source=("${_gitdir}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitdir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_gitdir}"
  cp -rv ${srcdir}/${_gitdir}/usr ${pkgdir}/usr
}
