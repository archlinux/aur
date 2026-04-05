# Maintainer: katsura-kotaro <katsura-kotaro@aur>
pkgname=keyarch-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Feature-rich TUI typing test with sound, training modes, and progress tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/vinayydv3695/keyarch"
license=('MIT')
depends=('glibc')
provides=('keyarch')
conflicts=('keyarch')
source_x86_64=("keyarch-${pkgver}-x86_64::https://github.com/vinayydv3695/keyarch/releases/download/v${pkgver}/keyarch-linux-amd64")
source_aarch64=("keyarch-${pkgver}-aarch64::https://github.com/vinayydv3695/keyarch/releases/download/v${pkgver}/keyarch-linux-arm64")
sha256sums_x86_64=('7145c739b7924b7ace5428de3f059391879529608e20731c31422591d2c7209f')
sha256sums_aarch64=('c37fc5b0613b2ed73919f62eaf277d9d2f9d46b7fb1f32b827ceb481e3e01c5d')

package() {
    install -Dm755 "${srcdir}/keyarch-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/keyarch"
}
