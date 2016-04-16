# Maintainer: Michael Latman <mlatman@gmail.com>
pkgname=whatsie
pkgver=2.0.13
pkgrel=1
epoch=
pkgdesc="A simple & beautiful desktop client for WhatsApp Web."
arch=('any')
url="https://whatsie.chat"
license=('MIT')
groups=()
depends=("dpkg")
makedepends=()
checkdepends=()
optdepends=('lsb-release')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=".INSTALL"
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()
package(){
wget "https://github.com/Aluxian/Whatsie/releases/download/v$pkgver/whatsie-$pkgver-linux-amd64.deb" -P build_step/
dpkg -x "build_step/whatsie-$pkgver-linux-amd64.deb" "$pkgdir/"

}
md5sums=()
