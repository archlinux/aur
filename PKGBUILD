pkgname=vimnm-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Aplikasi TUI (Vim-motion) untuk mengelola koneksi Wi-Fi menggunakan NetworkManager"
arch=('x86_64')
url="https://github.com/MatchaTi/vimnm"
license=('MIT')
depends=('networkmanager')
provides=('vimnm')
conflicts=('vimnm')
source=("${url}/releases/download/v${pkgver}/vimnm_Linux_x86_64.tar.gz")

sha256sums=('sha256:72c936e886e6a5be08eef08bc02343b5dd636db1d14e38656ccd4e925de48edb')

package() {
    install -Dm755 "${srcdir}/vimnm" "${pkgdir}/usr/bin/vimnm"
}
