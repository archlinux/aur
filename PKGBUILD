# Maintainer: Adria <adria@lightpanda.io>
pkgname=lightpanda-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="The headless browser designed for AI and data scripting"
arch=('x86_64' 'aarch64')
url="https://github.com/lightpanda-io/browser"
license=('AGPL-3.0')
provides=('lightpanda')
conflicts=('lightpanda')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-x86_64-linux")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-aarch64-linux")

sha256sums_x86_64=('bbcf15b651de46c78d1b3f564895e72beb8d9d81c5a7f9b0bd00049c2b311f6e')
sha256sums_aarch64=('0349e0f95b8c13b98c0ed3ace176bbcecaecec4674a9a2cfaedd53794f426094')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lightpanda"
}
