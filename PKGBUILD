# Maintainer: jonnyb <jbe@xfoo.eu>
pkgname=stalwart-cli
pkgver=0.7.2
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
source_x86_64=("https://github.com/stalwartlabs/mail-server/releases/download/v$pkgver/$pkgname-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/stalwartlabs/mail-server/releases/download/v$pkgver/$pkgname-aarch64-unknown-linux-gnu.tar.gz")
noextract=()
sha256sums=()
sha256sums_x86_64=('e0635af39b4e3b214fc553bb48c72255df2d6cc252dd10eb4f6b99731ca4bba7')
sha256sums_aarch64=('c7f05746fc4c324aa7b17032ffd433d73a6d97aedfbb1151a9c8eab7edb11873')
validpgpkeys=()

package() {
    mkdir -p $pkgdir/usr/bin/
    install -m755 stalwart-cli $pkgdir/usr/bin/
}
