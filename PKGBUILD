# Maintainer: Romain GERARD <erebe@erebe.eu>

pkgname=greenclip
pkgver=1.2
pkgrel=1
epoch=1
pkgdesc="Clipboard manager to use with rofi"
arch=('x86_64')
url="https://github.com/erebe/greenclip"
license=('GPL')
groups=()
depends=('rofi')
makedepends=()
checkdepends=()
optdepends=()
provides=("greenclip")
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=changelog
source=("https://github.com/erebe/greenclip/releases/download/1.2/greenclip")
noextract=()
sha256sums=("1212a32a875ffcb7c7d7396f1faa52c7d210c1baa10fddb55773cf528fd02554")

package() {
        install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

