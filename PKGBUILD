pkgname=opengamepadui-session-git
_gitdir=OpenGamepadUI-session
pkgver=r2.9f5cf87
pkgrel=1
pkgdesc="OpenGamepadUI Gamescope session for ChimeraOS Experimental"
arch=('any')
url="https://github.com/ShadowBlip/OpenGamepadUI-session"
makedepends=('git')
source=("${_gitdir}::git+https://github.com/ShadowBlip/${_gitdir}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitdir}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_gitdir}"
  cp -rv ${srcdir}/${_gitdir}/usr ${pkgdir}/usr
}
