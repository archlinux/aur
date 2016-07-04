# Maintainer: Konstantin Stepanov <me@kstep.me>
pkgname=cargo-pkgbuild
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="ArchLinux's PKGBULD generator from Cargo.toml manifest file"
url='https://github.com/kstep/cargo-pkgbuild'
license=('MIT/Apache-2.0')

build() {
    return 0
}

package() {
    cargo install --root="$pkgdir" cargo-pkgbuild
}
