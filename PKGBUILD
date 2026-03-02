# Maintainer: stickpro <your@email.com>
pkgname=kyp-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Local-first terminal password manager with TOTP support"
arch=('x86_64' 'aarch64')
url="https://github.com/stickpro/kyp"
license=('MIT')
provides=('kyp')
conflicts=('kyp' 'kyp-git')
source_x86_64=("https://github.com/stickpro/kyp/releases/download/v${pkgver}/kyp_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/stickpro/kyp/releases/download/v${pkgver}/kyp_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
package() {
	install -Dm755 kyp "${pkgdir}/usr/bin/kyp"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

