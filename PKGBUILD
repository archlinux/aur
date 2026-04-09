# Maintainer: Suletta Mercury <hazfen@proton.me>
pkgname=segfault
pkgver=1.0
pkgrel=1
pkgdesc="program to trigger segfault by dereferencing a nullptr"
arch=('x86_64')
url="https://github.com/asticassiasuletta/segfault"
license=('MIT')
depends=('glibc')
source=("main.c")
sha256sums=('05138eee82afc95c9bcbbdc999519097691063e1ae43ce774c5fd4b7a1821a59')
options=('!debug' '!strip')

build() {
	gcc main.c -o "$pkgname"
}

package() {
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
