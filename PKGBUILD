# Maintainer: 0chroma <me@chroma.sh>
pkgname=libdecsync-bin
pkgver=2.2.1
pkgrel=2
pkgdesc='libdecsync is a multiplatform library for synchronizing using DecSync.'
arch=(aarch64)
url='https://github.com/39aldo39/libdecsync'
license=('custom:LGPL2')
depends=(gcc-libs)  # libdecsync.so depends on libgcc_s.so.1
optdepends=()
provides=(libdecsync)
#makedepends=(jre8-openjdk ncurses5-compat-libs)
source=("libdecsync_arm64.so::https://github.com/0chroma/libdecsync/releases/download/v2.2.1/libdecsync_arm64.so")
sha256sums=('e8bb54ca7086d3d1d79b9987b904b34a6f4db3c9353b066f102f90cfffd5ab9b')

package() {
    cd "$srcdir"
    install -Dm644 "libdecsync_arm64.so" "${pkgdir}/usr/lib/libdecsync.so"
}
