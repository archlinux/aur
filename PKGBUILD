# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <josh at joshdabo dot sh>
_pkgname="susfetch"
pkgname=$_pkgname-git
pkgver=0.1.1
pkgrel=1
pkgdesc="Neofetch, but sus"
arch=(any)
url="https://github.com/joshdabosh/susfetch"
license=('MIT')
groups=()
depends=(neofetch jp2a)
makedepends=(git)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git#branch=master")


package() {
        mkdir -p $pkgdir/usr/bin
        mkdir -p $pkgdir/usr/share/$_pkgname
	echo $_pkgname
	echo $pkgdir
	echo 123
        install -m 0755 $_pkgname/$_pkgname       $pkgdir/usr/bin/$_pkgname
	echo "fdds"
        install -m 0644 $_pkgname/amongus.jpg     $pkgdir/usr/share/$_pkgname/amongus.jpg
}
sha256sums=('SKIP')
