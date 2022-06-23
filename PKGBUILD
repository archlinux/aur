# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=jpwd
pkgver=0.0.3
pkgrel=0
epoch=0
pkgdesc="A modern alternative to GNU/pwd using Java 🥰☕"
arch=('any')
url="https://github.com/Anas-Elgarhy/jpwd"
license=('GPL3')
groups=('java-utils')
depends=('jdk17-openjdk' 'nerd-fonts-hack')
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
source=("https://github.com/Anas-Elgarhy/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()
package() {
    sudo install -Dm644 "./$pkgname.jar" "/usr/share/java/$pkgname/$pkgname.jar"
    sudo install -Dm777 "./$pkgname.sh" "/bin/$pkgname"
}
sha256sums=('ccb2caf9e47dbdc55e70f8e2b5565d183b238d5e247aaa78a6c6fd58e2e97221')
