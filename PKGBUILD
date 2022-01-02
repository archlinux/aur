# Maintainer: Ondrej Dohnal <dohnal@douball.eu>
pkgname=libczech
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="The czech library for C. Why? Because we could, of course!"
arch=('any')
url="https://github.com/Toaster192/czech.h"
license=('MIT')
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
install=$pkgname.install
changelog=
source=("https://raw.githubusercontent.com/Toaster192/czech.h/master/czech.h")
noextract=()
sha256sums=("5b7ce4614ee26a48a591f1ab629765848347239e0d19df38d071f3e7e16837a6")
validpgpkeys=()

#prepare() {

#}

#build() {
#}

#check() {
#}

package() {
        install -d $pkgdir/usr/include
        install -m0644 czech.h $pkgdir/usr/include/czech.h
}
