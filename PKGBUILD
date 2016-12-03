# Maintainer: Mathias Bragagia <youremail@domain.com>
pkgname=numix-bevel-icon-theme
pkgver=1.0
pkgrel=2
pkgdesc="Bevel icon theme from the Numix project"
arch=('any')
url="https://slackbuilds.org/repository/14.2/desktop/numix-icon-theme-bevel/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=('numix-bevel-icon-theme-git')
conflicts=('numix-bevel-icon-theme-git')
replaces=()
backup=()
options=()
install=
changelog=
source=(https://launchpad.net/~numix/+archive/ubuntu/ppa/+files/numix-icon-theme-bevel_1.0+201410212340~8~ubuntu14.10.1.tar.xz)
noextract=()
md5sums=('SKIP')

package() {
	mkdir $pkgdir/usr/
	mkdir $pkgdir/usr/share/
	mkdir $pkgdir/usr/share/icons/
	mv $srcdir/numix-icon-theme-bevel-1.0+201410212340~8~ubuntu14.10.1/Numix-Bevel $pkgdir/usr/share/icons/
}
