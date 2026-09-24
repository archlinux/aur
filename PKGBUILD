# Maintainer: calvchn <calvinforyou at proton dot me>

pkgname=ornithe-installer-bin
pkgver=0.5.4
pkgrel=1
pkgdesc='Installer for ornithe, written in rust'
arch=('x86_64' 'aarch64')
url='https://github.com/OrnitheMC/ornithe-installer-rs'
license=('Apache-2.0')
options=('!strip')

source_x86_64=("ornithe-installer-rs-linux-x86_64-${pkgver}::https://maven.ornithemc.net/releases/net/ornithemc/ornithe-installer-rs/ornithe-installer-rs-linux-x86_64/${pkgver}/ornithe-installer-rs-linux-x86_64-${pkgver}")
source_aarch64=("ornithe-installer-rs-linux-aarch64-${pkgver}::https://maven.ornithemc.net/releases/net/ornithemc/ornithe-installer-rs/ornithe-installer-rs-linux-aarch64/${pkgver}/ornithe-installer-rs-linux-aarch64-${pkgver}")

sha256sums_x86_64=('057c21b8b83ac94601c12b9108046dbefaa7dbea303e54fa44c6674770046257')
sha256sums_aarch64=('9fc32c4bc10cf11be9a238f7f4761e8726d936cd1595a13903fc49c2ffab3d81')

package() {
    install -Dm755 "${srcdir}/ornithe-installer-rs-linux-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/ornithe-installer"
}
