# Maintainer: Sven Rademakers <sven.rademakers@gmail.com>
pkgname=tpi-bin
pkgver=1.0.7
pkgrel=1
pkgdesc='Official Turing-Pi2 CLI tool'
url=https://turingpi.com/
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
source_x86_64=("https://github.com/turing-machines/tpi/releases/download/${pkgver}/tpi-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/turing-machines/tpi/releases/download/${pkgver}/tpi-aarch64-unknown-linux-gnu.tar.gz")

package() {
    tar -xzf "${srcdir}/tpi-${CARCH}-unknown-linux-gnu.tar.gz" -C "${pkgdir}"
}
sha256sums_x86_64=('71e8c61f00b6197e4e0264b2a5dafe842ac1ea270d746187802d88792b1f7c74')
sha256sums_aarch64=('320138a2d2eb10778922c63b84db22f2fc247d023d753d1030ee8affb255a392')
