# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=jpwd
pkgver=0.0.5
pkgrel=0
epoch=0
pkgdesc="A modern alternative to GNU/pwd using Java 🥰☕"
arch=('any')
url="https://github.com/0x61nas/jpwd"
license=('GPL3')
groups=('java-utils')
depends=('java-runtime>=17')
optdepends=('ttf-fira-code: for icons')
install=
changelog=
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('ad6552fa7ee2042dca6bc4b041e13fcfada4d784380e35423a1aea963fa9152e')
validpgpkeys=()
package() {
    install -Dm644 "./$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -Dm777 "./$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
