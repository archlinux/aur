# Maintainer: Gustaf Eden <your-email@example.com>
pkgname=rsfetch-gustafeden-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Fast system fetch display for your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/gustafeden/rsfetch"
license=('MIT')
provides=('rsfetch')
conflicts=('rsfetch')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/gustafeden/rsfetch/releases/download/v${pkgver}/rsfetch-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/gustafeden/rsfetch/releases/download/v${pkgver}/rsfetch-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('49889500dd44c33c44cd517c532eb6e0d741c49140fb47a27deb6ef27fc8bfba')
sha256sums_aarch64=('dc4bd91cc2caf04a4840eeae041eceaebc05d8233807cd04fbc3cf74be7f1cea')

package() {
    install -Dm755 "${srcdir}/rsfetch" "${pkgdir}/usr/bin/rsfetch"
}
