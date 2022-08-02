# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
#pkgbase="console_snake"
pkgname="console_snake"
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="UNIX sn@ke game"
arch=('any')
url="https://github.com/TopProHatsker/snake"
license=('GPL')
groups=()
depends=()
makedepends=(fakeroot gcc git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://raw.githubusercontent.com/TopProHatsker/snake/master/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('699c7ea233d4049cc7c014848eb38db5')
validpgpkeys=()


package() {
    tar -xf $pkgname-$pkgver.tar.gz

	make DESTDIR="$pkgdir/"

    install -D snake "$pkgdir/usr/bin/snake"
}
 
