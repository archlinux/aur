
# Maintainer: jonnyb <jbe@xfoo.eu>
pkgname=stalwart-cli
pkgver=0.3.10
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
sha256sums=("6076b07965621723becf807295424bc259df16b64e414b0c98878e3c3dec77a7")
validpgpkeys=()

package() {
    mkdir -p $pkgdir/usr/bin/
    install -m755 stalwart-cli $pkgdir/usr/bin/
}