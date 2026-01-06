# Maintainer: reklis <reklis@users.noreply.github.com>
pkgname=pihosts-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI tool to manage Pi-hole DNS hosts via the v6 API"
arch=('x86_64' 'aarch64')
url="https://github.com/reklis/pihosts"
license=('GPL-3.0-only')
provides=('pihosts')
conflicts=('pihosts')

source_x86_64=("pihosts-${pkgver}-x86_64::https://github.com/reklis/pihosts/releases/download/v${pkgver}/pihosts-linux-amd64")
source_aarch64=("pihosts-${pkgver}-aarch64::https://github.com/reklis/pihosts/releases/download/v${pkgver}/pihosts-linux-arm64")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 "${srcdir}/pihosts-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/pihosts"
}
