# Maintainer: jonnyb <jbe@xfoo.eu>
pkgname=stalwart-cli
pkgver=0.7.1
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
sha256sums=('e42334c6d6b2e4387f4de839dabe14b7cd8866d99a239c8e4fc60621610524a8')
validpgpkeys=()

package() {
    mkdir -p $pkgdir/usr/bin/
    install -m755 stalwart-cli $pkgdir/usr/bin/
}
