# Maintainer: Pinapelz <yukais@pinapelz.com>
pkgname=kshook-wine
pkgver='1.1'
pkgrel=1
epoch=
pkgdesc="A helper for setting up and injecting kshook into SDVX KONASTE running in a Wine environment"
arch=('x86_64')
url="https://github.com/pinapelz/kshook-wine"
license=('MIT')
groups=()
depends=( 'bash' 'wine>=9.0' 'curl' )
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=("$url/archive/refs/tags/$pkgver.zip")
#source=("konaste-linux-v${pkgver}.tar.gz")
noextract=()
sha256sums=('9f0e083bcb985120e733cf200e5ac4db498816671877a6acc72be25d6610587a')
validpgpkeys=()

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "man/kshook-wine.1" "$pkgdir/usr/share/man/man1/kshook-wine.1"
}
