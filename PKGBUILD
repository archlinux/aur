# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=jls
pkgver=0.3.5
pkgrel=0
epoch=0
pkgdesc="A modern ls with java."
arch=('any')
url="https://github.com/Anas-Elgarhy/jls"
license=('GPL3')
groups=('java-utils')
depends=('jdk17-openjdk' 'nerd-fonts-hack')
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
source=("https://github.com/Anas-Elgarhy/jls/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()
package() {
    sudo install -Dm644 ./jls.jar "/usr/share/java/jls/jls.jar"
    sudo install -Dm777 ./jls.sh "/bin/jls"
}
sha256sums=('b36ae9cff855ed000d2949226c1d961882e8b1b8be11f44147a0fd64ff4b5939')
