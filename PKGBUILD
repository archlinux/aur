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

sha256sums=('0028b2488565a63d78d6d5d4f48746498a722f10887969f0511487509602a114')

package() {
    install -Dm755 "${srcdir}/vimnm" "${pkgdir}/usr/bin/vimnm"
}
