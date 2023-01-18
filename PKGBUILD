# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=jpwd
pkgver=0.0.4
pkgrel=1
epoch=0
pkgdesc="A modern alternative to GNU/pwd using Java 🥰☕"
arch=('any')
url="https://github.com/anas-elgarhy/jpwd"
license=('GPL3')
groups=('java-utils')
depends=('jdk17-openjdk' 'ttf-hack-nerd')
makedepends=()
checkdepends=()
optdepends=()
provides=("$pkgname")
conflicts=()
replaces=("$pkgname")
backup=()
options=()
install=
changelog=
source=("https://github.com/anas-elgarhy/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('04df1e3f03a7ace9adc41f0ff6488482d3a19a6bb7a212be06fff0ed873c611d')
validpgpkeys=()
package() {
    sudo install -Dm644 "./$pkgname.jar" "/usr/share/java/$pkgname/$pkgname.jar"
    sudo install -Dm777 "./$pkgname.sh" "/bin/$pkgname"
}
