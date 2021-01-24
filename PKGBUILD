# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=kh-webstore
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc=""
arch=(x86_64)
url=""
license=('Apache')
groups=()
depends=()
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
source=("https://github.com/CentRa-Linux/kh-webstore/releases/download/release/kh-webstore-0.0.1.tar.gz")
noextract=()
md5sums=("c25af2b64554532e2905e66c61e44d5c")
validpgpkeys=()

build() {
	sudo cp -rf "$pkgname-$pkgver" "/usr/share/kh-webstore"
    cd "$pkgname-$pkgver"
    sudo cp -rf "kh-webstore.desktop" "/usr/share/applications/kh-webstore.desktop"
}

package() {
    mkdir $pkgdir/usr
    mkdir $pkgdir/usr/share
    mkdir $pkgdir/usr/share/applications
    sudo cp -rf "$pkgname-$pkgver" "$pkgdir/usr/share/kh-webstore"
    cd "$pkgname-$pkgver"
    sudo cp -rf "kh-webstore.desktop" "$pkgdir/usr/share/applications/kh-webstore.desktop"
}
