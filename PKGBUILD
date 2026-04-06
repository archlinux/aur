# Maintainer: katsura-kotaro <katsura-kotaro@aur>
pkgname=keyarch-bin
pkgver=1.1.0
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
sha256sums_x86_64=('23b82253be5c72308a4b5900b0a7ad39b6b973ce46864b2c234cfb81f0cec1ec')
sha256sums_aarch64=('9e84108ae23ca0022a1157c05d8b1737fa70588bf1ef8af27dacc2ec6f25c980')

package() {
    install -Dm755 "${srcdir}/keyarch-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/keyarch"
}
