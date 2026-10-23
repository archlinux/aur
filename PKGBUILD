# Maintainer: Adria <adria@lightpanda.io>
pkgname=lightpanda-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="The headless browser designed for AI and data scripting"
arch=('x86_64' 'aarch64')
url="https://github.com/lightpanda-io/browser"
license=('AGPL-3.0-only')
provides=('lightpanda')
conflicts=('lightpanda')
depends=('glibc')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-x86_64-linux")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-aarch64-linux")

sha256sums_x86_64=('ae7d01d261efb9e480e18ce3424533332883863bcf70b12a4321b5733f37e19e')
sha256sums_aarch64=('ac546dfc43c533430da92b75ab36f2a29da7d6324d5d38baf606ef2e0d849345')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lightpanda"
}
