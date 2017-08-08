# Maintainer: Jose Riha <jose1711 gmail com>
# Generated with cargo-pkgbuild
pkgname=ruplicity-fuse
pkgver=0.0.1
pkgrel=1
makedepends=('rust' 'cargo')
depends=('fuse2')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/mbrt/ruplicity-fuse'
pkgdesc="Mount duplicity backups with userspace filesystem"
license=('GPL2')

package() {
    cd $srcdir
    cargo install --root="$pkgdir/usr" --git=https://github.com/mbrt/ruplicity-fuse
    rm $pkgdir/usr/.crates.toml
}
