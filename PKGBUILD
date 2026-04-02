# Maintainer: Adria <adria@lightpanda.io>
pkgname=lightpanda-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="The headless browser designed for AI and data scripting"
arch=('x86_64' 'aarch64')
url="https://github.com/lightpanda-io/browser"
license=('AGPL-3.0')
provides=('lightpanda')
conflicts=('lightpanda')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-x86_64-linux")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-aarch64-linux")

sha256sums_x86_64=('8e3a5e04cf508699990a78a0a8686ea3398912cd9891fda90513429b89230300')
sha256sums_aarch64=('9f54f2cc31b0dadd867ba06ecce59f8aa59f7876394798e97882aea680b5ad19')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lightpanda"
}
