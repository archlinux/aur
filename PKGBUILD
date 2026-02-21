pkgname=vimnm-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Aplikasi TUI (Vim-motion) untuk mengelola koneksi Wi-Fi menggunakan NetworkManager"
arch=('x86_64')
url="https://github.com/MatchaTi/vimnm"
license=('MIT')
depends=('networkmanager')
provides=('vimnm')
conflicts=('vimnm')
source=("${url}/releases/download/v${pkgver}/vimnm_Linux_x86_64.tar.gz")

sha256sums=('e1b5d10354afcbaf06aaa5528754345e6aae7e7d54f0096c21ceda231889b175')

package() {
    install -Dm755 "${srcdir}/vimnm" "${pkgdir}/usr/bin/vimnm"
}
