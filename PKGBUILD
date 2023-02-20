# Maintainer: Mahid Sheikh <mahidsheikh@pm.me>
# Contributor: Eric Lu 
pkgname=clyde-aur-git
_pkgname=clyde
pkgver=30.42d76d8
pkgrel=1
pkgdesc="Simple AUR helper written in Bash"
arch=(any)
url="https://github.com/StandingPadAnimations/clyde"
depends=(bash-completion jq)
makedepends=(git)
source=("git+https://github.com/StandingPadAnimations/clyde")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package () {
	install -D -t "$pkgdir/usr/bin" "$_pkgname/clyde"
}
