# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=nardy
pkgver=1
pkgrel=1
epoch=
pkgdesc="Console game"
arch=(any)
url="https://github.com/TopProHatsker/Nardy"
license=('GPL')
groups=()
depends=("python3")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://raw.githubusercontent.com/TopProHatsker/Nardy/master/nardy.py"
"https://raw.githubusercontent.com/TopProHatsker/Nardy/master/nardy")

noextract=()
md5sums=("SKIP" "SKIP")
validpgpkeys=()

package() {
#	cd "$pkgname-$pkgver"
#	make DESTDIR="$pkgdir/" install
	install -D nardy.py "$pkgdir/usr/share/nardy.py"
	install -D nardy "$pkgdir/usr/bin/$pkgname"
}
