# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=jls
pkgver=0.3.4
pkgrel=0
epoch=0
pkgdesc="A modern ls with java."
arch=('any')
url="https://github.com/Anas-Elgarhy/jls"
license=('GPL3')
groups=('java-utils')
depends=('jdk-openjdk' 'nerd-fonts-fira-code')
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
sha256sums=('7eecaaa33723c710598490f8cc9b81fe8a033456b52f8794614bb453a85ce564')

package() {
    sudo install -Dm644 ./jls.jar "/usr/share/java/jls/jls.jar"
    sudo install -Dm777 ./jls.sh "/bin/jls"
}
