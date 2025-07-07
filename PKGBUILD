# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=xfsrtray-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A floating and customizable system tray for Linux"
arch=('x86_64')
url="https://github.com/Byson94/xfsrtray"
license=('GPL')
depends=()
makedepends=()
provides=('xfsrtray')
conflicts=('xfsrtray' 'xfsrtray-git')
source=("https://github.com/Byson94/xfsrtray/releases/download/v${pkgver}/xfsrtray")
sha256sums=('fb4f94af1caff1b51e0b91311c1e40e6d5b8bf3611f76cca336b6ff3af550dd3')

package() {
    install -Dm755 "$srcdir/xfsrtray" "$pkgdir/usr/bin/xfsrtray"
}
