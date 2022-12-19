# Maintainer: alexcoder04 <alexcoder04@protonmail.com>
pkgname=nspire-merge
pkgver=1.0.1
pkgrel=1
pkgdesc="Merging Lua source files and images for TI-Nspire projects"
arch=('x86_64')
url="https://github.com/alexcoder04/nspire-merge"
license=('MIT')
groups=()
depends=(python python-glob2 python-pillow python-argparse)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=('66fcd955ec8ae484fb8c03787cf59ed0')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

