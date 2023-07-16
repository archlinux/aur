# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=jls
pkgver=0.3.5
pkgrel=3
epoch=0
pkgdesc="A modern ls with java."
arch=('any')
url="https://github.com/anas-elgarhy/jls"
license=('GPL3')
groups=('java-utils')
depends=('java-runtime>=17')
makedepends=()
checkdepends=()
optdepends=('ttf-hack-nerd: For icons support')
options=()
install=
changelog=
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
package() {
    install -Dm644 ./jls.jar "$pkgdir/usr/share/java/jls/jls.jar"
    install -Dm777 ./jls.sh "$pkgdir/bin/jls"
}
sha256sums=('b36ae9cff855ed000d2949226c1d961882e8b1b8be11f44147a0fd64ff4b5939')
