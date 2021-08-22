# Maintainer: Kival Mahadew <kivalm@protonmail.com>
pkgname=spotblock-rs
pkgver=r5.bc34039
pkgdesc="Spotify Advertisment blocker for linux"
pkgrel=1
depends=('playerctl')
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/StarPlatin4m/spotblock-rs'
license=('GPL3')
source=("$pkgname::git+https://github.com/StarPlatin4m/spotblock-rs")
md5sums=('SKIP')


build() {
    cd "$pkgname"
    cargo build --release
    return 0
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/spotblock-rs/target/release/spotblock-rs" "${pkgdir}/usr/bin/spotblock"
    chmod +x "${pkgdir}/usr/bin/spotblock"

}
# Maintainer: Kival Mahadew <kivalm@protonmail.com>
pkgname=spotblock-rs
pkgver=r5.bc34039
pkgdesc="Spotify Advertisment blocker for linux"
pkgrel=1
depends=('playerctl')
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/StarPlatin4m/spotblock-rs'
license=('GPL3')
source=("$pkgname::git+https://github.com/StarPlatin4m/spotblock-rs")
md5sums=('SKIP')


build() {
    cd "$pkgname"
    cargo build --release
    return 0
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/spotblock-rs/target/release/spotblock-rs" "${pkgdir}/usr/bin/spotblock"
    chmod +x "${pkgdir}/usr/bin/spotblock"

}

