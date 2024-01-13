# Maintainer: Comamoca <comamoca.dev@gmail.com>
pkgname=era-bin
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc="A rainy clock in your terminal."
arch=('x86_64')
url="https://github.com/kyoheiu/era"
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
options=('!strip')
install=
changelog=
source=(https://github.com/kyoheiu/era/releases/download/v$pkgver/era-v$pkgver-$CARCH-linux.tar.gz)
noextract=()
md5sums=('958eac74089e1b0ddbdba12b24bed33a')
validpgpkeys=()

package() {
    tar -zxvf "era-v$pkgver-$CARCH-linux.tar.gz" &> /dev/null
    install -Dm755 era "${pkgdir}/usr/bin/era"
}
