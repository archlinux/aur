# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=xfsrtray-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="A floating and customizable system tray for Linux"
arch=('x86_64')
url="https://github.com/Byson94/xfsrtray"
license=('GPL')
depends=()
makedepends=()
source=("https://github.com/Byson94/xfsrtray/releases/download/v${pkgver}/xfsrtray")
sha256sums=('fa439f4acf9ce8f78f584e1fb9c4cbb7a357c3ecce32f63bbf7e7b4754a578ec')

package() {
    install -Dm755 "$srcdir/xfsrtray" "$pkgdir/usr/bin/xfsrtray"
}
