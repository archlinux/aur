# Maintainer: 0chroma <me@chroma.sh>
pkgname=libdecsync-bin
pkgver=2.2.1
pkgrel=1
pkgdesc='libdecsync is a multiplatform library for synchronizing using DecSync.'
arch=(aarch64)
url='https://github.com/39aldo39/libdecsync'
license=('custom:LGPL2')
depends=(gcc-libs)  # libdecsync.so depends on libgcc_s.so.1
optdepends=()
provides=(libdecsync)
#makedepends=(jre8-openjdk ncurses5-compat-libs)
source=("libdecsync_arm64.so.zip::https://github.com/39aldo39/libdecsync/suites/4690991839/artifacts/128014137")
sha256sums=('3f67953509d0703544c0f116ac6b91d646aeec1562876d332cb90dc8252c36bd')

package() {
    cd "$srcdir"
    install -Dm644 "libdecsync.so" "${pkgdir}/usr/lib/libdecsync.so"
}
