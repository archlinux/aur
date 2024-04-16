# Maintainer: jonnyb <jbe@xfoo.eu>
pkgname=stalwart-cli
pkgver=0.7.1
pkgrel=2
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
sha256sums_x86_64=('e42334c6d6b2e4387f4de839dabe14b7cd8866d99a239c8e4fc60621610524a8')
sha256sums_aarch64=('06bd4ec829ba06237c1d408fa2572db6fe2445c3d39af64431e923ffe971ae03')
validpgpkeys=()

package() {
    mkdir -p $pkgdir/usr/bin/
    install -m755 stalwart-cli $pkgdir/usr/bin/
}
