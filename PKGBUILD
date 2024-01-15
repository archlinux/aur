# Maintainer: jonnyb <jbe@xfoo.eu>
pkgname=stalwart-cli
pkgver=0.5.3
pkgrel=1
epoch=
pkgdesc="Stalwart CLI"
arch=("x86_64" "aarch64")
url="https://stalw.art/"
license=('AGPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/stalwartlabs/mail-server/releases/download/v$pkgver/$pkgname-$arch-unknown-linux-gnu.tar.gz")
noextract=()
sha256sums=('c4a287cdcfbb9d8f4aa57c997d52c0875868ad1966e6580805e80eda8ea27676')
validpgpkeys=()

package() {
    mkdir -p $pkgdir/usr/bin/
    install -m755 stalwart-cli $pkgdir/usr/bin/
}
