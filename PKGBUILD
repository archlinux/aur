# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=fmradio-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="An FM radio demodulator and RDS decoder in pure Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/desperado"
license=('MIT')
depends=('alsa-lib')
provides=('fmradio')
conflicts=('fmradio')

source_x86_64=("${url}/releases/download/v${pkgver}/fmradio-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/fmradio-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 "fmradio" "${pkgdir}/usr/bin/fmradio"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/fmradio/readme.md"
}
