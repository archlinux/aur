# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
#pkgbase="console_snake"
pkgname="console_snake"
pkgver=1
pkgrel=1
epoch=
pkgdesc="UNIX sn@ke game"
arch=('any')
url="https://github.com/TopProHatsker/snake"
license=('GPL')
groups=()
depends=()
makedepends=(gcc git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "https://raw.githubusercontent.com/TopProHatsker/snake/master/Makefile"
    "https://raw.githubusercontent.com/TopProHatsker/snake/master/main.c"
    "https://raw.githubusercontent.com/TopProHatsker/snake/master/list.c"
    "https://raw.githubusercontent.com/TopProHatsker/snake/master/matrix.c"
    "https://raw.githubusercontent.com/TopProHatsker/snake/master/list.h"
    "https://raw.githubusercontent.com/TopProHatsker/snake/master/matrix.h"
    )
noextract=()
md5sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP")
validpgpkeys=()


package() {
#	install -Dm755 "$srcdir/pkg/nardy-bin/usr/bin/nardy" "$pkgdir/usr/bin/nardy"
	#cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/"

    install -D console_snake "$pkgdir/usr/bin/snake"
}
 
