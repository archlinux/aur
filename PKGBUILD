# Maintainer: Joaquim Madureira <joaquimmadureira at protonmail dot com>
pkgname=warewoolf-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A novel-writing system/rich text editor designed to be usable without a mouse."
arch=('x86_64')
url="https://github.com/brsloan/warewoolf"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libdrm' 'libxcb' 'trash-cli')
source=("https://github.com/brsloan/warewoolf/releases/download/v2.0.0/warewoolf_2.0.0_amd64.deb")
sha256sums=('b44b86e0881cb4d32a103e925baaece4abd455d07e3d1e21b79bcbda0e80c16c')

package() {
    tar -xf data.tar.zst -C "${pkgdir}"
    chmod 755 -R "${pkgdir}"
}
