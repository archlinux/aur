# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=jls
pkgver=0.3.7
pkgrel=1
epoch=0
pkgdesc="A modern ls with java."
arch=('any')
url="https://github.com/anas-elgarhy/jls"
license=('GPL3')
groups=('java-utils')
depends=('jdk17-openjdk' 'ttf-hack-nerd')
makedepends=()
checkdepends=()
optdepends=()
provides=(jls)
conflicts=()
replaces=(jls)
backup=()
options=()
install=
changelog=
source=("https://github.com/anas-elgarhy/jls/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('e23eea206c418d4d5089186219de37f4167a7d54e1ac99dc8e29fad82126efab')
validpgpkeys=()
package() {
    sudo install -Dm644 ./jls.jar "/usr/share/java/jls/jls.jar"
    sudo install -Dm777 ./jls.sh "/bin/jls"
}
